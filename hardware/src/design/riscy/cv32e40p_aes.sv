////////////////////////////////////////////////////////////////////////////////
// Engineer:       Borislav Semerdzhiev - bsemerdzhiev@tudelft.nl             //
//                                                                            //
// Additional contributions by:                                               //
// Isidora Jovanovic - Decryption                                             //
//                                                                            //
//                                                                            //
// Design Name:    AES                                                        //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Performs the AES encryption single run with a selected byte//
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
module gf_mult#()
(
//inputs
  input logic [7: 0] a,
  input logic [7: 0] b,

//outputs
  output logic [7:0] result
);
logic [7:0] shifting_a;
logic [7:0] shifting_b;
logic       hi_bit;

always_comb begin 
  shifting_a = a;
  shifting_b = b;
  result = 0;
  hi_bit = 0;

  for (int i = 0; i < 8; i++) begin
    if (shifting_b[0] == '1) begin
      result = result ^ shifting_a;
    end

    hi_bit = shifting_a[7];
    shifting_a = shifting_a << 1;

    if (hi_bit == '1) begin
      shifting_a = shifting_a ^ 8'h1b;
    end
    
    shifting_b = shifting_b >> 1;
  end
end

endmodule

module mix_columns#()
(
  //inputs
  input logic [7: 0] col,
  input logic [1:0]  bs,

  // 0 - encryption / 1 - decryption
  input logic direction,

  //outputs
  output logic [31:0] result
);

// encryption
logic [7:0] results_enc[0:1];

gf_mult u_col_one   (.a(8'h02), .b(col), .result(results_enc[0]));
gf_mult u_col_two   (.a(8'h03), .b(col), .result(results_enc[1]));

// decryption
logic [7:0] results_dec[0:3];

gf_mult u_col_one_dec (.a(8'h0e), .b(col), .result(results_dec[0]));
gf_mult u_col_two_dec (.a(8'h0b), .b(col), .result(results_dec[1]));
gf_mult u_col_three_dec (.a(8'h0d), .b(col), .result(results_dec[2]));
gf_mult u_col_four_dec (.a(8'h09), .b(col), .result(results_dec[3]));


always_comb begin
  result = 32'h0;

  case(bs)
    2'd0: begin
      if (direction == '0) begin
        result = {results_enc[0], col, col, results_enc[1]};
      end else begin
        result = {results_dec[0], results_dec[1], results_dec[2], results_dec[3]};
      end
    end

    2'd1: begin
      if (direction == '0) begin
        result = {results_enc[1], results_enc[0], col, col};
      end else begin
        result = {results_dec[3], results_dec[0], results_dec[1], results_dec[2]};
      end
    end

    2'd2: begin
      if (direction == '0) begin
        result = {col, results_enc[1], results_enc[0], col};
      end else begin
        result = {results_dec[2], results_dec[3], results_dec[0], results_dec[1]};
      end
    end

    2'd3: begin
      if (direction == '0) begin
        result = {col, col, results_enc[1], results_enc[0]};
      end else begin
        result = {results_dec[1], results_dec[2], results_dec[3], results_dec[0]};
      end
    end
  endcase
end
endmodule


module cv32e40p_aes
  import cv32e40p_pkg::*;
  import aes_pkg::*;
#()
(
  //inputs
  input logic [1:0]         bs_i,
  input logic [31:0]        matrix_input_i,
  input logic [31:0]        key_i,

  // 00 - esmi, 01 - esi, 10 - dsmi, 11 - dsi
  input logic [1:0]         chosen_op_i,

  //outputs
  output logic [31:0]       aes_o
);

logic [5:0] shamt;
logic [7:0] sbox_input;
logic [7:0] sbox_output;
logic direction = chosen_op_i[0];

logic [7:0] mix_columns_col_i;
logic [31:0] mix_columns_o;

mix_columns mix_columns_i(.col(mix_columns_col_i), .bs(bs_i), .direction(direction), .result(mix_columns_o));

assign aes_o = (chosen_op_i == 2'b00 || chosen_op_i == 2'b10) ? (key_i ^ mix_columns_o) : (key_i ^ {24'h0, sbox_output});

always_comb begin
  shamt = {1'b0, bs_i, 3'b0};
  sbox_input = matrix_input_i[shamt +: 8];

  mix_columns_col_i = 0;

  case(chosen_op_i)

    ////////////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  ______  _____ __  __ _____   //
    //     /\   |  ____|/ ____|___ \__ \|  ____|/ ____|  \/  |_   _|  //
    //    /  \  | |__  | (___   __) | ) | |__  | (___ | \  / | | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /|  __|  \___ \| |\/| | | |    //
    //  / ____ \| |____ ____) |___) / /_| |____ ____) | |  | |_| |_   //
    // /_/    \_\______|_____/|____/____|______|_____/|_|  |_|_____|  //
    ////////////////////////////////////////////////////////////////////
    2'b00: begin
      sbox_output = AES_SBOX[sbox_input];
      mix_columns_col_i = sbox_output;
    end

    /////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  ______  _____ __  __  //
    //     /\   |  ____|/ ____|___ \__ \|  ____|/ ____|_   _|  //
    //    /  \  | |__  | (___   __) | ) | |__  | (___   | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /|  __|  \___ \  | |    //
    //  / ____ \| |____ ____) |___) / /_| |____ ____) |_| |_   //
    // /_/    \_\______|_____/|____/____|______|_____/|_____|  //
    /////////////////////////////////////////////////////////////
    // TODO: add logic for esi


    ////////////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  _____   _____ __  __ _____   //
    //     /\   |  ____|/ ____|___ \__ \|  __ \ / ____|  \/  |_   _|  //
    //    /  \  | |__  | (___   __) | ) | |  | | (___ | \  / | | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /| |  | |\___ \| |\/| | | |    //
    //  / ____ \| |____ ____) |___) / /_| |__| |____) | |  | |_| |_   //
    // /_/    \_\______|_____/|____/____|_____/|_____/|_|  |_|_____|  //
    ////////////////////////////////////////////////////////////////////
    2'b10: begin
      sbox_output = AES_INV_SBOX[sbox_input];
      mix_columns_col_i = sbox_output;
    end

    /////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  _____   _____ _____   //
    //     /\   |  ____|/ ____|___ \__ \|  __ \ / ____|_   _|  //
    //    /  \  | |__  | (___   __) | ) | |  | | (___   | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /| |  | |\___ \  | |    //
    //  / ____ \| |____ ____) |___) / /_| |__| |____) |_| |_   //
    // /_/    \_\______|_____/|____/____|_____/|_____/|_____|  //
    /////////////////////////////////////////////////////////////
    2'b11: begin
      sbox_output = AES_INV_SBOX[sbox_input];
    end
   endcase
end
endmodule
