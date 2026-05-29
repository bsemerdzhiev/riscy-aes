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
  input  logic        clk_i,
  input  logic        rst_n,

  input  logic        we_i,
  //input  logic        key_sel_i,   // 0 = state, 1 = key
  input  logic [2:0]  waddr_i,
  input  logic [31:0] wdata_i,

  input logic  [127:0] aes_flush_state_i,
  input logic          aes_flush_we_i,

  output logic [127:0] state_o,
  output logic [127:0] key_o
);

  logic [127:0] state_q;
  logic [127:0] key_q;
  logic         key_sel;
  
  assign key_sel = waddr_i[2];

  always_ff @(posedge clk_i or negedge rst_n) begin
    if (!rst_n) begin
      state_q <= 128'b0;
      key_q   <= 128'b0;
    end else begin
      if (we_i) begin
        if (key_sel) begin
          key_q[waddr_i[1:0]*32 +: 32] <= wdata_i;
        end else begin
          state_q[waddr_i[1:0]*32 +: 32] <= wdata_i;
        end
      end else if (aes_flush_we_i) begin
        // the encryption in the ex stage has completed and the results are
        // flushed here
        state_q <= aes_flush_state_i;
      end
    end
  end

  assign state_o = state_q;
  assign key_o   = key_q;

endmodule
