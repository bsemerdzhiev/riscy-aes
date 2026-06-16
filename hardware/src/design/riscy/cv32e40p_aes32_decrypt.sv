module cv32e40p_aes32_decrypt
  import cv32e40p_pkg::*;
  import cv32e40p_aes_pkg::*;
#()
(
  input logic clk_i,
  input logic rst_ni,
  input logic enable_i,                // high when we can start decrypting

  input logic [127:0] ciphertext_i,
  input logic [127:0] round_key_i,     // initial round key loaded by aes32_load

  output logic ready_o,                // high when we're done with decryption
  output logic [127:0] plaintext_o,

  output logic aes_flush_en_o
);

// fsm states
typedef enum logic [2:0] {
  IDLE = 3'd0,
  KEY_EXPAND = 3'd1,
  STAGE_ONE = 3'd2,
  STAGE_TWO = 3'd3,
  FLUSH = 3'd4,
  FLUSH_DONE = 3'd5,
  START = 3'd6,
  BEFORE_START = 3'd7
} aes_state_e;

aes_state_e state_q, state_d;

logic [127:0] aes_block_q, aes_block_d;
logic [127:0] round_key_q, round_key_d;
logic [3:0] round_q, round_d;

function automatic logic [7:0] xtime(input logic [7:0] b);
  return {b[6:0], 1'b0} ^ (b[7] ? 8'h1b : 8'h00);
endfunction

// added this so the multiplication in inv mix columns is cleaner
function automatic logic [7:0] gf_mul(input logic [7:0] a, input logic [7:0] b);
  logic [7:0] p;
  logic [7:0] tmp;

  p = 8'h00;
  tmp = a;

  for (int i = 0; i < 8; i++) begin
    if (b[i]) p = p ^ tmp;
    tmp = xtime(tmp);
  end

  return p;
endfunction

// round constants for key schedule
function automatic logic [31:0] aes_rcon(input logic [3:0] r);
  unique case (r)
    4'd1: return 32'h01000000;
    4'd2: return 32'h02000000;
    4'd3: return 32'h04000000;
    4'd4: return 32'h08000000;
    4'd5: return 32'h10000000;
    4'd6: return 32'h20000000;
    4'd7: return 32'h40000000;
    4'd8: return 32'h80000000;
    4'd9: return 32'h1b000000;
    4'd10: return 32'h36000000;
    default: return 32'h00000000;
  endcase
endfunction



// round constants for key schedule (reverse from encrypt version)
function automatic logic [31:0] aes_rcon_inv(input logic [3:0] r);
  unique case (r)
    4'd1: return 32'h36000000;
    4'd2: return 32'h1b000000;
    4'd3: return 32'h80000000;
    4'd4: return 32'h40000000;
    4'd5: return 32'h20000000;
    4'd6: return 32'h10000000;
    4'd7: return 32'h08000000;
    4'd8: return 32'h04000000;
    4'd9: return 32'h02000000;
    4'd10: return 32'h01000000;
    default: return 32'h00000000;
  endcase
endfunction


function automatic logic [31:0] sub_word_inv(input logic [31:0] w);
  return {AES_INV_SBOX[w[31:24]], AES_INV_SBOX[w[23:16]], AES_INV_SBOX[w[15:8]], AES_INV_SBOX[w[7:0]]};
endfunction


function automatic logic [31:0] sub_word(input logic [31:0] w);
  return {AES_SBOX[w[31:24]], AES_SBOX[w[23:16]], AES_SBOX[w[15:8]], AES_SBOX[w[7:0]]};
endfunction


function automatic logic [127:0] key_expand(input logic [127:0] key, input logic [3:0] next_round);
  logic [31:0] w0, w1, w2, w3, temp, w0n;

  w0 = key[127:96];
  w1 = key[95:64];
  w2 = key[63:32];
  w3 = key[31:0];
  temp = sub_word({w3[23:0], w3[31:24]}) ^ aes_rcon(next_round);
  w0n = w0 ^ temp;
  return {w0n,
          w1 ^ w0n,
          w2 ^ w1 ^ w0n,
          w3 ^ w2 ^ w1 ^ w0n};
endfunction


// we start from round key 10 and go backwards
function automatic logic [127:0] key_expand_inv(input logic [127:0] key, input logic [3:0] curr_round);
  logic [31:0] w0n, w1n, w2n, w3n;
    logic [31:0] w0, w1, w2, w3, temp;

    w0n = key[127:96];
    w1n = key[95:64];
    w2n = key[63:32];
    w3n = key[31:0];

    w3  = w3n ^ w2n;
    w2  = w2n ^ w1n;
    w1  = w1n ^ w0n;

    temp = sub_word({w3[23:0], w3[31:24]}) ^ aes_rcon_inv(curr_round);
    w0  = w0n ^ temp;

    return {w0, w1, w2, w3};
endfunction


function automatic logic [127:0] aes_sub_bytes_inv(input logic [127:0] state);
  logic [127:0] result;
  for (int i = 0; i < 16; i++) begin
    result[127 - i*8 -: 8] = AES_INV_SBOX[state[127 - i*8 -: 8]];
  end
  return result;
endfunction


function automatic logic [127:0] aes_shift_rows_inv(input logic [127:0] state);
  logic [7:0] b [0:15];
  for (int i = 0; i < 16; i++) begin
    b[i] = state[127 - i*8 -: 8];
  end
  return {b[0], b[13], b[10], b[7],
          b[4], b[1], b[14], b[11],
          b[8], b[5], b[2], b[15],
          b[12], b[9], b[6], b[3]};
endfunction


function automatic logic [127:0] aes_mix_columns_inv(input logic [127:0] state);
  logic [127:0] result;
  logic [7:0] a0, a1, a2, a3;

  for (int col = 0; col < 4; col++) begin
    a0 = state[127 - col*32 -: 8];
    a1 = state[127 - col*32 - 8 -: 8];
    a2 = state[127 - col*32 - 16 -: 8];
    a3 = state[127 - col*32 - 24 -: 8];

    result[127 - col*32 -: 8] = gf_mul(8'h0e,a0) ^ gf_mul(8'h0b,a1) ^ gf_mul(8'h0d,a2) ^ gf_mul(8'h09,a3);
    result[127 - col*32 - 8 -: 8] = gf_mul(8'h09,a0) ^ gf_mul(8'h0e,a1) ^ gf_mul(8'h0b,a2) ^ gf_mul(8'h0d,a3);
    result[127 - col*32 - 16 -: 8] = gf_mul(8'h0d,a0) ^ gf_mul(8'h09,a1) ^ gf_mul(8'h0e,a2) ^ gf_mul(8'h0b,a3);
    result[127 - col*32 - 24 -: 8] = gf_mul(8'h0b,a0) ^ gf_mul(8'h0d,a1) ^ gf_mul(8'h09,a2) ^ gf_mul(8'h0e,a3);
  end

  return result;
endfunction


always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    state_q <= IDLE;
    aes_block_q <= '0;
    round_key_q <= '0;
    round_q <= '0;
  end else begin
    state_q  <= state_d;
    aes_block_q <= aes_block_d;
    round_key_q <= round_key_d;
    round_q <= round_d;
  end
end

always_comb begin
  state_d = state_q;
  aes_block_d = aes_block_q;
  round_key_d = round_key_q;
  round_d = round_q;
  ready_o = 1'b0;

  aes_flush_en_o = 1'b0;

  case (state_d)
    IDLE: begin
      ready_o = 1'b1; // just idle, so the pipeline can work on smth else

      if (enable_i) begin
        if (round_d == 4'd0) begin
          ready_o = 1'b0;

          state_d = BEFORE_START;
        end
      end else begin
        round_d = 4'd0;
      end
    end

    BEFORE_START: begin
      state_d = START;
    end

    START: begin
      aes_block_d = {ciphertext_i[7:0],   ciphertext_i[15:8],  ciphertext_i[23:16], ciphertext_i[31:24],
              ciphertext_i[39:32],  ciphertext_i[47:40], ciphertext_i[55:48], ciphertext_i[63:56],
              ciphertext_i[71:64],  ciphertext_i[79:72], ciphertext_i[87:80], ciphertext_i[95:88],
              ciphertext_i[103:96], ciphertext_i[111:104], ciphertext_i[119:112], ciphertext_i[127:120]};

      round_key_d = {round_key_i[7:0],   round_key_i[15:8],  round_key_i[23:16], round_key_i[31:24],
            round_key_i[39:32], round_key_i[47:40], round_key_i[55:48], round_key_i[63:56],
            round_key_i[71:64], round_key_i[79:72], round_key_i[87:80], round_key_i[95:88],
            round_key_i[103:96], round_key_i[111:104], round_key_i[119:112], round_key_i[127:120]};

      round_d = 4'd1;
      state_d = KEY_EXPAND;
    end

    KEY_EXPAND: begin
      round_key_d = key_expand(round_key_d, round_d);
      round_key_d = key_expand(round_key_d, round_d + 4'd1);
      round_d = round_d + 4'd2;

      if (round_d > 4'd10) begin
        aes_block_d = aes_block_d ^ round_key_d;
        round_d = 4'd1;
        state_d = STAGE_ONE;
      end else begin
        state_d = KEY_EXPAND;
      end
    end

    STAGE_ONE: begin
      aes_block_d = aes_shift_rows_inv(aes_block_d);
      aes_block_d = aes_sub_bytes_inv(aes_block_d);

      state_d = STAGE_TWO;
    end

    STAGE_TWO: begin
      round_key_d = key_expand_inv(round_key_d, round_d);
      aes_block_d = aes_block_d ^ round_key_d;

      if (round_d < 4'd10) begin
        aes_block_d = aes_mix_columns_inv(aes_block_d);
        state_d = STAGE_ONE;
      end else begin
        state_d = FLUSH;
      end

      round_d = round_d + 4'd1;
    end

    FLUSH: begin
      aes_flush_en_o = 1'b1;

      state_d = FLUSH_DONE;
    end

    FLUSH_DONE: begin
      state_d = IDLE;
    end
  endcase
end

assign plaintext_o = {aes_block_q[7:0],   aes_block_q[15:8],  aes_block_q[23:16], aes_block_q[31:24],
                       aes_block_q[39:32],  aes_block_q[47:40], aes_block_q[55:48], aes_block_q[63:56],
                       aes_block_q[71:64],  aes_block_q[79:72], aes_block_q[87:80], aes_block_q[95:88],
                       aes_block_q[103:96], aes_block_q[111:104], aes_block_q[119:112], aes_block_q[127:120]};


endmodule