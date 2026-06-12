// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// Engineer:       Daniel Stefanov                                            //
//                 Borislav Semerdzhiev                                       //
//                 Isidora Jovanovic                                          //
//                 Nazar Vasyliev                                              //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    Top level module                                           //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:                                                               //
////////////////////////////////////////////////////////////////////////////////


module cv32e40p_aes32
  import cv32e40p_aes_pkg::*;
(
  input  logic         clk_i,
  input  logic         rst_ni,

  input  logic         enc_en_i,       // start/continue an encrypt
  input  logic         dec_en_i,       // start/continue a decrypt

  input  logic [127:0] data_i,         // plaintext (enc) or ciphertext (dec)
  input  logic [127:0] round_key_i,    // original cipher key

  output logic         ready_o,        // high when idle (pipeline may proceed)
  output logic [127:0] result_o,       // ciphertext (enc) or plaintext (dec)
  output logic         aes_flush_en_o
);

  typedef enum logic [2:0] {
    IDLE = 3'd0, BEFORE_START = 3'd1, START = 3'd2, KEY_EXPAND = 3'd3,
    STAGE_ONE = 3'd4, STAGE_TWO = 3'd5, FLUSH = 3'd6, FLUSH_DONE = 3'd7
  } aes_state_e;

  aes_state_e   state_q, state_d;
  logic [127:0] aes_block_q, aes_block_d;
  logic [127:0] round_key_q, round_key_d;
  logic [3:0]   round_q, round_d;
  logic         dec_mode_q, dec_mode_d;   // 1 = decrypt, latched at START

  function automatic logic [7:0] xtime(input logic [7:0] b);
    return {b[6:0], 1'b0} ^ (b[7] ? 8'h1b : 8'h00);
  endfunction
  function automatic logic [7:0] gf_mul(input logic [7:0] a, input logic [7:0] b);
    logic [7:0] p, tmp;
    p = 8'h00; tmp = a;
    for (int i = 0; i < 8; i++) begin
      if (b[i]) p = p ^ tmp;
      tmp = xtime(tmp);
    end
    return p;
  endfunction

  function automatic logic [31:0] aes_rcon(input logic [3:0] r);
    unique case (r)
      4'd1: return 32'h01000000; 4'd2: return 32'h02000000; 4'd3: return 32'h04000000;
      4'd4: return 32'h08000000; 4'd5: return 32'h10000000; 4'd6: return 32'h20000000;
      4'd7: return 32'h40000000; 4'd8: return 32'h80000000; 4'd9: return 32'h1b000000;
      4'd10: return 32'h36000000; default: return 32'h00000000;
    endcase
  endfunction
  function automatic logic [31:0] aes_rcon_inv(input logic [3:0] r);
    unique case (r)
      4'd1: return 32'h36000000; 4'd2: return 32'h1b000000; 4'd3: return 32'h80000000;
      4'd4: return 32'h40000000; 4'd5: return 32'h20000000; 4'd6: return 32'h10000000;
      4'd7: return 32'h08000000; 4'd8: return 32'h04000000; 4'd9: return 32'h02000000;
      4'd10: return 32'h01000000; default: return 32'h00000000;
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
    w0n  = w0 ^ temp;
    return {w0n, w1 ^ w0n, w2 ^ w1 ^ w0n, w3 ^ w2 ^ w1 ^ w0n};
  endfunction

  function automatic logic [127:0] key_expand_inv(input logic [127:0] key, input logic [3:0] curr_round);
    logic [31:0] w0n, w1n, w2n, w3n, w0, w1, w2, w3, temp;
    w0n = key[127:96]; 
    w1n = key[95:64]; 
    w2n = key[63:32]; 
    w3n = key[31:0];
    w3 = w3n ^ w2n; 
    w2 = w2n ^ w1n; 
    w1 = w1n ^ w0n;
    temp = sub_word({w3[23:0], w3[31:24]}) ^ aes_rcon_inv(curr_round);
    w0 = w0n ^ temp;
    return {w0, w1, w2, w3};
  endfunction

  function automatic logic [127:0] sub_bytes(input logic [127:0] s);
    logic [127:0] r;
    for (int i = 0; i < 16; i++) r[127 - i*8 -: 8] = AES_SBOX[s[127 - i*8 -: 8]];
    return r;
  endfunction
  function automatic logic [127:0] sub_bytes_inv(input logic [127:0] s);
    logic [127:0] r;
    for (int i = 0; i < 16; i++) r[127 - i*8 -: 8] = AES_INV_SBOX[s[127 - i*8 -: 8]];
    return r;
  endfunction

  function automatic logic [127:0] shift_rows(input logic [127:0] s);
    logic [7:0] b [0:15];
    for (int i = 0; i < 16; i++) b[i] = s[127 - i*8 -: 8];
    return {b[0], b[5], b[10], b[15], b[4], b[9], b[14], b[3],
            b[8], b[13], b[2], b[7], b[12], b[1], b[6], b[11]};
  endfunction
  function automatic logic [127:0] shift_rows_inv(input logic [127:0] s);
    logic [7:0] b [0:15];
    for (int i = 0; i < 16; i++) b[i] = s[127 - i*8 -: 8];
    return {b[0], b[13], b[10], b[7], b[4], b[1], b[14], b[11],
            b[8], b[5], b[2], b[15], b[12], b[9], b[6], b[3]};
  endfunction

  function automatic logic [127:0] mix_columns(input logic [127:0] s);
    logic [127:0] r; logic [7:0] a0, a1, a2, a3;
    for (int c = 0; c < 4; c++) begin
      a0 = s[127 - c*32 -: 8];      
      a1 = s[127 - c*32 - 8 -: 8];
      a2 = s[127 - c*32 - 16 -: 8]; 
      a3 = s[127 - c*32 - 24 -: 8];
      r[127 - c*32 -: 8]      = xtime(a0) ^ xtime(a1) ^ a1 ^ a2 ^ a3;
      r[127 - c*32 - 8 -: 8]  = a0 ^ xtime(a1) ^ xtime(a2) ^ a2 ^ a3;
      r[127 - c*32 - 16 -: 8] = a0 ^ a1 ^ xtime(a2) ^ xtime(a3) ^ a3;
      r[127 - c*32 - 24 -: 8] = xtime(a0) ^ a0 ^ a1 ^ a2 ^ xtime(a3);
    end
    return r;
  endfunction
  function automatic logic [127:0] mix_columns_inv(input logic [127:0] s);
    logic [127:0] r; logic [7:0] a0, a1, a2, a3;
    for (int c = 0; c < 4; c++) begin
      a0 = s[127 - c*32 -: 8];      
      a1 = s[127 - c*32 - 8 -: 8];
      a2 = s[127 - c*32 - 16 -: 8]; 
      a3 = s[127 - c*32 - 24 -: 8];
      r[127 - c*32 -: 8]      = gf_mul(8'h0e,a0) ^ gf_mul(8'h0b,a1) ^ gf_mul(8'h0d,a2) ^ gf_mul(8'h09,a3);
      r[127 - c*32 - 8 -: 8]  = gf_mul(8'h09,a0) ^ gf_mul(8'h0e,a1) ^ gf_mul(8'h0b,a2) ^ gf_mul(8'h0d,a3);
      r[127 - c*32 - 16 -: 8] = gf_mul(8'h0d,a0) ^ gf_mul(8'h09,a1) ^ gf_mul(8'h0e,a2) ^ gf_mul(8'h0b,a3);
      r[127 - c*32 - 24 -: 8] = gf_mul(8'h0b,a0) ^ gf_mul(8'h0d,a1) ^ gf_mul(8'h09,a2) ^ gf_mul(8'h0e,a3);
    end
    return r;
  endfunction

  function automatic logic [127:0] byteswap(input logic [127:0] x);
    return {x[7:0],   x[15:8],   x[23:16],  x[31:24],
            x[39:32], x[47:40],  x[55:48],  x[63:56],
            x[71:64], x[79:72],  x[87:80],  x[95:88],
            x[103:96],x[111:104],x[119:112],x[127:120]};
  endfunction

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state_q     <= IDLE;
      aes_block_q <= '0;
      round_key_q <= '0;
      round_q     <= '0;
      dec_mode_q  <= 1'b0;
    end else begin
      state_q     <= state_d;
      aes_block_q <= aes_block_d;
      round_key_q <= round_key_d;
      round_q     <= round_d;
      dec_mode_q  <= dec_mode_d;
    end
  end

  always_comb begin
    state_d        = state_q;
    aes_block_d    = aes_block_q;
    round_key_d    = round_key_q;
    round_d        = round_q;
    dec_mode_d     = dec_mode_q;
    ready_o        = 1'b0;
    aes_flush_en_o = 1'b0;

    case (state_q)
      IDLE: begin
        ready_o = 1'b1;
        if (enc_en_i || dec_en_i) begin
          if (round_q == 4'd0) begin
            ready_o    = 1'b0;
            dec_mode_d = dec_en_i;          // mutually exclusive; 1 => decrypt
            state_d    = BEFORE_START;
          end
        end else begin
          round_d = 4'd0;
        end
      end

      BEFORE_START: state_d = START;

      START: begin
        aes_block_d = byteswap(data_i);
        round_key_d = byteswap(round_key_i);
        round_d     = 4'd1;
        if (dec_mode_q) begin
          state_d = KEY_EXPAND;                      // decrypt: derive round-10 key first
        end else begin
          aes_block_d = aes_block_d ^ round_key_d;   // encrypt: initial AddRoundKey
          round_key_d = key_expand(round_key_d, 4'd1);
          state_d     = STAGE_ONE;
        end
      end

      KEY_EXPAND: begin  // decrypt only
        round_key_d = key_expand(round_key_d, round_d);
        round_key_d = key_expand(round_key_d, round_d + 4'd1);
        round_d     = round_d + 4'd2;
        if (round_d > 4'd10) begin
          aes_block_d = aes_block_d ^ round_key_d;
          round_d     = 4'd1;
          state_d     = STAGE_ONE;
        end else begin
          state_d = KEY_EXPAND;
        end
      end

      STAGE_ONE: begin
        if (dec_mode_q) begin
          aes_block_d = shift_rows_inv(aes_block_d);
          aes_block_d = sub_bytes_inv(aes_block_d);
        end else begin
          aes_block_d = sub_bytes(aes_block_d);
          aes_block_d = shift_rows(aes_block_d);
        end
        state_d = STAGE_TWO;
      end

      STAGE_TWO: begin
        if (dec_mode_q) begin
          round_key_d = key_expand_inv(round_key_d, round_d);
          aes_block_d = aes_block_d ^ round_key_d;
          if (round_d < 4'd10) begin
            aes_block_d = mix_columns_inv(aes_block_d);
            state_d     = STAGE_ONE;
          end else begin
            state_d = FLUSH;
          end
          round_d = round_d + 4'd1;
        end else begin
          if (round_d < 4'd10) begin
            aes_block_d = mix_columns(aes_block_d);
            state_d     = STAGE_ONE;
          end else begin
            state_d = FLUSH;
          end
          round_d     = round_d + 4'd1;
          aes_block_d = aes_block_d ^ round_key_d;
          round_key_d = key_expand(round_key_d, round_d);
        end
      end

      FLUSH:      begin aes_flush_en_o = 1'b1; state_d = FLUSH_DONE; end
      FLUSH_DONE: state_d = IDLE;
      default:    state_d = IDLE;
    endcase
  end

  assign result_o = byteswap(aes_block_q);

endmodule
