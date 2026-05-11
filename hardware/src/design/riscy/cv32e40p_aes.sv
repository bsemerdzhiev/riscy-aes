////////////////////////////////////////////////////////////////////////////////
// Engineer:       Borislav Semerdzhiev - bsemerdzhiev@tudelft.nl             //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    AES                                                        //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Performs the AES encryption single run on a selected byte  //
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

//outputs
  output logic [31:0] result
);

logic [7:0] results[0:1];

gf_mult u_col_one   (.a(8'h02), .b(col), .result(results[0]));
gf_mult u_col_two   (.a(8'h03), .b(col), .result(results[1]));

always_comb begin
  result = 32'h0;

  case(bs)
    2'd0: begin
      result = {results[0], col, col, results[1]};
    end

    2'd1: begin
      result = {results[1], results[0], col, col};
    end

    2'd2: begin
      result = {col, results[1], results[0], col};
    end

    2'd3: begin
      result = {col, col, results[1], results[0]};
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
    input logic               enable_i,

    input logic [1:0]         bs_i,
    input logic [31:0]        matrix_input_i,
    input logic [31:0]        key_i,

    input logic [2:0]         chosen_op_i,

//outputs
    output logic [31:0]       mix_columns_o
);

logic [5:0] shamt;
logic [7:0] sbox_input;
logic [7:0] sbox_output;

logic [7:0] mix_columns_col_i;

mix_columns mix_columns_i(.col(mix_columns_col_i), .bs(bs_i), .result(mix_columns_o));

////////////////////////////////////////////////////////////////////
//           ______  _____ ____ ___  ______  _____ __  __ _____   //
//     /\   |  ____|/ ____|___ \__ \|  ____|/ ____|  \/  |_   _|  //
//    /  \  | |__  | (___   __) | ) | |__  | (___ | \  / | | |    //
//   / /\ \ |  __|  \___ \ |__ < / /|  __|  \___ \| |\/| | | |    //
//  / ____ \| |____ ____) |___) / /_| |____ ____) | |  | |_| |_   //
// /_/    \_\______|_____/|____/____|______|_____/|_|  |_|_____|  //
////////////////////////////////////////////////////////////////////

always_comb begin
  shamt = {1'b0, bs_i, 3'b0};
  sbox_input = matrix_input_i[shamt +: 8];
  sbox_output = AES_SBOX[sbox_input];

  mix_columns_col_i = key_i ^ sbox_output;
end

/////////////////////////////////////////////////////////////
//           ______  _____ ____ ___  ______  _____ __  __  //
//     /\   |  ____|/ ____|___ \__ \|  ____|/ ____|_   _|  //
//    /  \  | |__  | (___   __) | ) | |__  | (___   | |    //
//   / /\ \ |  __|  \___ \ |__ < / /|  __|  \___ \  | |    //
//  / ____ \| |____ ____) |___) / /_| |____ ____) |_| |_   //
// /_/    \_\______|_____/|____/____|______|_____/|_____|  //
/////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//           ______  _____ ____ ___  _____   _____ __  __ _____   //
//     /\   |  ____|/ ____|___ \__ \|  __ \ / ____|  \/  |_   _|  //
//    /  \  | |__  | (___   __) | ) | |  | | (___ | \  / | | |    //
//   / /\ \ |  __|  \___ \ |__ < / /| |  | |\___ \| |\/| | | |    //
//  / ____ \| |____ ____) |___) / /_| |__| |____) | |  | |_| |_   //
// /_/    \_\______|_____/|____/____|_____/|_____/|_|  |_|_____|  //
////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////
//           ______  _____ ____ ___  _____   _____ _____   //
//     /\   |  ____|/ ____|___ \__ \|  __ \ / ____|_   _|  //
//    /  \  | |__  | (___   __) | ) | |  | | (___   | |    //
//   / /\ \ |  __|  \___ \ |__ < / /| |  | |\___ \  | |    //
//  / ____ \| |____ ____) |___) / /_| |__| |____) |_| |_   //
// /_/    \_\______|_____/|____/____|_____/|_____/|_____|  //
/////////////////////////////////////////////////////////////

endmodule
