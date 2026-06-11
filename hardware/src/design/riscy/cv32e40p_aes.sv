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
    if (shifting_b[0] == 1'b1) begin
      result = result ^ shifting_a;
    end

    hi_bit = shifting_a[7];
    shifting_a = shifting_a << 1;

    if (hi_bit == 1'b1) begin
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
gf_mult u_col_two_dec (.a(8'h09), .b(col), .result(results_dec[1]));
gf_mult u_col_three_dec (.a(8'h0d), .b(col), .result(results_dec[2]));
gf_mult u_col_four_dec (.a(8'h0b), .b(col), .result(results_dec[3]));


always_comb begin
  result = 32'h0;
  if (direction == '0) begin
        result = {results_enc[1], col, col, results_enc[0]};
  end else begin
        result = {results_dec[3], results_dec[2], results_dec[1], results_dec[0]};
  end
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


  input crypto_op_e   chosen_op_i,

  //outputs
  output logic [31:0]       aes_o
);

logic [5:0] shamt;
logic [7:0] sbox_input;
logic [7:0] sbox_output;

logic [7:0]  mix_columns_col_i;
logic [31:0] mix_columns_o;

logic [31:0] rotated_word;
logic [31:0] transformed_word;
logic [31:0] sbox_word;


//TODO: Check why it breaks the testbench
//logic direction = chosen_op_i[1];   // bit 1 for direction
logic direction;

assign direction = chosen_op_i[1];

mix_columns mix_columns_i(.col(mix_columns_col_i), .bs(bs_i), .direction(direction), .result(mix_columns_o));

assign sbox_word = {24'h0, sbox_output};

assign transformed_word = chosen_op_i[0] ? 
                          mix_columns_o: 
                          sbox_word;

always_comb begin
  unique case (bs_i)
    2'b00: rotated_word = transformed_word;
    2'b01: rotated_word = {transformed_word[23:0], transformed_word[31:24]};
    2'b10: rotated_word = {transformed_word[15:0], transformed_word[31:16]};
    2'b11: rotated_word = {transformed_word[7:0],  transformed_word[31:8]};
  endcase
end

assign aes_o = key_i ^ rotated_word;
               
always_comb begin
  shamt = {bs_i, 3'b0};
  sbox_input = matrix_input_i[shamt +: 8];

  mix_columns_col_i = 0;
  sbox_output = 0;

  case(chosen_op_i)

    ////////////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  ______  _____ __  __ _____   //
    //     /\   |  ____|/ ____|___ \__ \|  ____|/ ____|  \/  |_   _|  //
    //    /  \  | |__  | (___   __) | ) | |__  | (___ | \  / | | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /|  __|  \___ \| |\/| | | |    //
    //  / ____ \| |____ ____) |___) / /_| |____ ____) | |  | |_| |_   //
    // /_/    \_\______|_____/|____/____|______|_____/|_|  |_|_____|  //
    ////////////////////////////////////////////////////////////////////
    AES32_ESMI: begin
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
    AES32_ESI: begin
       sbox_output = AES_SBOX[sbox_input];
    end


    ////////////////////////////////////////////////////////////////////
    //           ______  _____ ____ ___  _____   _____ __  __ _____   //
    //     /\   |  ____|/ ____|___ \__ \|  __ \ / ____|  \/  |_   _|  //
    //    /  \  | |__  | (___   __) | ) | |  | | (___ | \  / | | |    //
    //   / /\ \ |  __|  \___ \ |__ < / /| |  | |\___ \| |\/| | | |    //
    //  / ____ \| |____ ____) |___) / /_| |__| |____) | |  | |_| |_   //
    // /_/    \_\______|_____/|____/____|_____/|_____/|_|  |_|_____|  //
    ////////////////////////////////////////////////////////////////////
    AES32_DSMI: begin
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
    AES32_DSI: begin
      sbox_output = AES_INV_SBOX[sbox_input];
    end
    
    default: begin             // default
      sbox_output = 0;
      mix_columns_col_i = 0;
    end
    
    
   endcase
   
   $display("op=%b bs=%0d shamt=%0d selected=%02h sbox=%02h mix_in=%02h mix_out=%08h aes=%08h",
           chosen_op_i,
           bs_i,
           shamt,
           sbox_input,
           sbox_output,
           mix_columns_col_i,
           mix_columns_o,
           aes_o);
end
endmodule
