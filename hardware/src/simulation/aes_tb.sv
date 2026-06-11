`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2026 12:41:14
// Design Name: 
// Module Name: aes_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
`include "assert.svh"

// Self-checking testbench for cv32e40p_aes
// Assumes aes_pkg defines:
     // AES32_ESI       = 2'b00,
     // AES32_ESMI      = 2'b01,
     // AES32_DSI       = 2'b10,
     // AES32_DSMI      = 2'b11 
// and AES_SBOX / AES_INV_SBOX are visible through aes_pkg.

module tb_cv32e40p_aes;

  import aes_pkg::*;
  import cv32e40p_pkg::*;

  logic [1:0]  bs_i;
  logic [31:0] matrix_input_i;
  logic [31:0] key_i;
  logic [1:0]  chosen_op_i;
  logic [31:0] aes_o;

  cv32e40p_aes dut (
    .bs_i(bs_i),
    .matrix_input_i(matrix_input_i),
    .key_i(key_i),
    .chosen_op_i(chosen_op_i),
    .aes_o(aes_o)
  );

  function automatic logic [7:0] ref_gf_mult(
    input logic [7:0] a,
    input logic [7:0] b
  );
    logic [7:0] aa;
    logic [7:0] bb;
    logic [7:0] rr;
    logic hi;

    begin
      aa = a;
      bb = b;
      rr = 8'h00;

      for (int i = 0; i < 8; i++) begin
        if (bb[0]) begin
          rr ^= aa;
        end

        hi = aa[7];
        aa = aa << 1;

        if (hi) begin
          aa ^= 8'h1b;
        end

        bb = bb >> 1;
      end

      return rr;
    end
  endfunction

  function automatic logic [31:0] ref_mix_column_contribution(
    input logic [7:0] col,
    input logic [1:0] bs,
    input logic decrypt
  );
    logic [7:0] x1, x2, x3;
    logic [7:0] x9, xb, xd, xe;

    begin
      x1 = col;
      x2 = ref_gf_mult(8'h02, col);
      x3 = ref_gf_mult(8'h03, col);

      x9 = ref_gf_mult(8'h09, col);
      xb = ref_gf_mult(8'h0b, col);
      xd = ref_gf_mult(8'h0d, col);
      xe = ref_gf_mult(8'h0e, col);

      if (!decrypt) begin
        case (bs)
          2'd0: return {x2, x1, x1, x3};
          2'd1: return {x3, x2, x1, x1};
          2'd2: return {x1, x3, x2, x1};
          2'd3: return {x1, x1, x3, x2};
        endcase
      end else begin
        case (bs)
          2'd0: return {xe, xb, xd, x9};
          2'd1: return {x9, xe, xb, xd};
          2'd2: return {xd, x9, xe, xb};
          2'd3: return {xb, xd, x9, xe};
        endcase
      end
    end
  endfunction

  function automatic logic [31:0] ref_aes32(
    input logic [1:0]  bs,
    input logic [31:0] matrix_input,
    input logic [31:0] key,
    input logic [1:0]  op
  );
    logic [5:0] shamt;
    logic [7:0] selected_byte;
    logic [7:0] sbox_byte;
    logic decrypt;
    logic mix_enable;
    logic [31:0] transformed;

    begin
      shamt = {1'b0, bs, 3'b000};  // shift amount, appending 3'b000 = *8, so it works on bytes
      selected_byte = matrix_input[shamt +: 8];

      decrypt    = op[1];
      mix_enable = op[0];

      if (decrypt) begin
        sbox_byte = AES_INV_SBOX[selected_byte];
      end else begin
        sbox_byte = AES_SBOX[selected_byte];
      end

      if (mix_enable) begin
        transformed = ref_mix_column_contribution(sbox_byte, bs, decrypt);
      end else begin
        transformed = {24'h0, sbox_byte};
      end
      
      $display("REF bs=%0d shamt=%0d selected=%02h sbox=%02h decrypt=%0d mix=%08h final=%08h",
         bs,
         shamt,
         selected_byte,
         sbox_byte,
         decrypt,
         transformed,
         key ^ transformed);
         
      return key ^ transformed;
    end
  endfunction

  task automatic check_one(
    input logic [1:0]  bs,
    input logic [31:0] matrix_input,
    input logic [31:0] key,
    input logic [1:0]  op
  );
    logic [31:0] expected;

    begin
      bs_i           = bs;
      matrix_input_i = matrix_input;
      key_i          = key;
      chosen_op_i    = op;

      #1;

      expected = ref_aes32(bs, matrix_input, key, op);
      /*
      if (aes_o !== expected) begin
        $error("AES mismatch: op=%b bs=%0d matrix=%08h key=%08h got=%08h expected=%08h",
               op, bs, matrix_input, key, aes_o, expected);
      end
      if (aes_o == expected) begin
        $display("AES correct: op=%b bs=%0d matrix=%08h key=%08h got=%08h expected=%08h",
               op, bs, matrix_input, key, aes_o, expected);
      end
      */
      #1;
      $display("TB_FINAL op=%b bs=%0d selected=%02h got=%08h expected=%08h",
                 op, bs, matrix_input[(bs*8)+:8], aes_o, expected);
    end
  endtask

task automatic check_decrypt(
    input logic [1:0]  bs,
    input logic [31:0] matrix_input,
    input logic [31:0] key,
    input logic [1:0]  op
  );
    logic [31:0] expected;

    begin
      bs_i           = bs;
      matrix_input_i = matrix_input;
      key_i          = key;
      chosen_op_i    = op;

      #1;

      /*
      if (aes_o !== expected) begin
        $error("AES mismatch: op=%b bs=%0d matrix=%08h key=%08h got=%08h expected=%08h",
               op, bs, matrix_input, key, aes_o, expected);
      end
      if (aes_o == expected) begin
        $display("AES correct: op=%b bs=%0d matrix=%08h key=%08h got=%08h expected=%08h",
               op, bs, matrix_input, key, aes_o, expected);
      end
      */
      #1;
      $display("Decrypt result op=%b bs=%0d selected=%02h got=%08h",
                 op, bs, matrix_input[(bs*8)+:8], aes_o);
    end
  endtask


  initial begin
    $display("Starting cv32e40p_aes self-checking testbench...");

    // Directed tests. These catch byte ordering, key XOR, and direction bugs.
    // check_one(2'd0, 32'h00112233, 32'h00000000, AES32_ESI);
    // check_one(2'd0, 32'hcafebabe, 32'hffffffff, AES32_ESMI);
    // check_one(2'd2, 32'hdeadbeef, 32'h12345678, AES32_DSMI);
    // check_one(2'd3, 32'hcafebabe, 32'hffffffff, AES32_DSI);

    // check_decrypt(2'd0, 32'h21548ba2, 32'h12345678, AES32_DSMI);
    // check_decrypt(2'd2, 32'h165151b8, 32'h1a2b7843, AES32_DSMI);
    // check_decrypt(2'd3, 32'h165151b8, 32'h1a2b7843, AES32_DSI);
    check_decrypt(2'd0, 32'h00000000, 32'h00000000, AES32_DSI);
    check_decrypt(2'd1, 32'h00000000, 32'h00000000, AES32_DSI);
    check_decrypt(2'd2, 32'h00000000, 32'h00000000, AES32_DSI);
    check_decrypt(2'd3, 32'h00000000, 32'h00000000, AES32_DSI);


    /*
    // Random tests over all opcodes and byte selects.
    for (int n = 0; n < 1000; n++) begin
      for (int op = 0; op < 4; op++) begin
        for (int bs = 0; bs < 4; bs++) begin
          check_one(
            logic'(bs[1:0]),
            $urandom(),
            $urandom(),
            logic'(op[1:0])
          );
        end
      end
    end
    */

    $display("cv32e40p_aes testbench completed.");
    $finish;
  end

endmodule

