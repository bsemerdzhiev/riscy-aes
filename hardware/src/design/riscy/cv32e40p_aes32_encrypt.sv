module cv32e40p_aes32_encrypt
  import cv32e40p_pkg::*;
  import cv32e40p_aes_pkg::*;
#()
(
  input logic clk_i,
  input logic rst_ni,
  input logic enable_i,                // high when we can start encrypting

  input logic ex_ready_i,              // transition back to IDLE when high (when the result can be latched)

  input logic [127:0] plaintext_i,
  input logic [127:0] round_key_i,     // initial round key loaded by aes32_load

  output logic ready_o,                // high when we're done with encryption
  output logic [127:0] ciphertext_o,

  output logic aes_flush_en_o
);

// fsm states
typedef enum logic [1:0] {
  IDLE = 2'd0,
  STAGE_ONE = 2'd1,
  STAGE_TWO = 2'd2,
  DONE = 2'd3
} aes_state_e;

aes_state_e state_q, state_d;

logic [127:0] aes_block_q, aes_block_d;
logic [127:0] round_key_q, round_key_d;
logic [3:0] round_q, round_d;

function automatic logic [7:0] xtime(input logic [7:0] b);
  return {b[6:0], 1'b0} ^ (b[7] ? 8'h1b : 8'h00);
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

function automatic logic [127:0] aes_sub_bytes(input logic [127:0] state);
  logic [127:0] result;
  for (int i = 0; i < 16; i++) begin
    result[127 - i*8 -: 8] = AES_SBOX[state[127 - i*8 -: 8]];
  end
  return result;
endfunction

function automatic logic [127:0] aes_shift_rows(input logic [127:0] state);
  logic [7:0] b [0:15];
  for (int i = 0; i < 16; i++) begin
    b[i] = state[127 - i*8 -: 8];
  end
  return {b[0], b[5], b[10], b[15],
          b[4], b[9], b[14], b[3],
          b[8], b[13], b[2], b[7],
          b[12], b[1], b[6], b[11]};
endfunction

function automatic logic [127:0] aes_mix_columns(input logic [127:0] state);
  logic [127:0] result;
  logic [7:0] a0, a1, a2, a3;
  logic [7:0] b0, b1, b2, b3;
  for (int col = 0; col < 4; col++) begin
    a0 = state[127 - col*32 -: 8];
    a1 = state[127 - col*32 - 8 -: 8];
    a2 = state[127 - col*32 - 16 -: 8];
    a3 = state[127 - col*32 - 24 -: 8];
    b0 = xtime(a0) ^ xtime(a1) ^ a1 ^ a2 ^ a3;
    b1 = a0 ^ xtime(a1) ^ xtime(a2) ^ a2 ^ a3;
    b2 = a0 ^ a1 ^ xtime(a2) ^ xtime(a3) ^ a3;
    b3 = xtime(a0) ^ a0 ^ a1 ^ a2 ^ xtime(a3);
    result[127 - col*32 -: 8] = b0;
    result[127 - col*32 - 8 -: 8] = b1;
    result[127 - col*32 - 16 -: 8] = b2;
    result[127 - col*32 - 24 -: 8] = b3;
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
        aes_block_d = {plaintext_i[7:0],   plaintext_i[15:8],  plaintext_i[23:16], plaintext_i[31:24],
               plaintext_i[39:32],  plaintext_i[47:40], plaintext_i[55:48], plaintext_i[63:56],
               plaintext_i[71:64],  plaintext_i[79:72], plaintext_i[87:80], plaintext_i[95:88],
               plaintext_i[103:96], plaintext_i[111:104], plaintext_i[119:112], plaintext_i[127:120]};
        // aes_block_d = plaintext_i;

        round_key_d = {round_key_i[7:0],   round_key_i[15:8],  round_key_i[23:16], round_key_i[31:24],
               round_key_i[39:32], round_key_i[47:40], round_key_i[55:48], round_key_i[63:56],
               round_key_i[71:64], round_key_i[79:72], round_key_i[87:80], round_key_i[95:88],
               round_key_i[103:96], round_key_i[111:104], round_key_i[119:112], round_key_i[127:120]};
        // round_key_d = round_key_i;


        round_d = 4'd1;
        state_d = STAGE_ONE;

        aes_block_d = aes_block_d ^ round_key_d;

        round_key_d = key_expand(round_key_d, 4'd1); 
      end
    end

    STAGE_ONE: begin
      // ready_o = 1'b0; // just idle, so the pipeline can work on smth else

      // sub bytes and shift rows
      aes_block_d = aes_sub_bytes(aes_block_d);
      aes_block_d = aes_shift_rows(aes_block_d);

      state_d = STAGE_TWO;
    end

    STAGE_TWO: begin
      // ready_o = 1'b0; // just idle, so the pipeline can work on smth else

      // mix columns and add round key
      if (round_d < 4'd10) begin
        aes_block_d = aes_mix_columns(aes_block_d);
        state_d = STAGE_ONE;
      end else begin
        state_d = DONE;
      end

      round_d = round_d + 4'd1;
      aes_block_d = aes_block_d ^ round_key_d;

      round_key_d = key_expand(round_key_d, round_d);
    end

    DONE: begin
      aes_flush_en_o = 1'b1;
      ready_o = 1'b1; // just idle, so the pipeline can work on smth else

      // if the result is ready to be latched then go back to idle
      if (ex_ready_i) begin
        state_d = IDLE;
      end
    end
  endcase
end

assign ciphertext_o = {aes_block_q[7:0],   aes_block_q[15:8],  aes_block_q[23:16], aes_block_q[31:24],
                       aes_block_q[39:32],  aes_block_q[47:40], aes_block_q[55:48], aes_block_q[63:56],
                       aes_block_q[71:64],  aes_block_q[79:72], aes_block_q[87:80], aes_block_q[95:88],
                       aes_block_q[103:96], aes_block_q[111:104], aes_block_q[119:112], aes_block_q[127:120]};

endmodule
