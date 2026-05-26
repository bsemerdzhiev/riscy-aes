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
// Engineer:       Daniel Stefanov -                                          //
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
// Description:    Top level module of the RISC-V core.                       //
//                 added APU, FPU parameter to include the APU_dispatcher     //
//                 and the FPU                                                //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module cv32e40p_aes_mem (
  input  logic        clk,
  input  logic        rst_n,

  input  logic        we_i,
  input  logic [2:0]  waddr_i,
  input  logic [31:0] wdata_i,

  output logic [127:0] state_o,
  output logic [127:0] key_o
);


logic          [255:0] shadow_regs;

//TODO: Finish the reg file

endmodule
