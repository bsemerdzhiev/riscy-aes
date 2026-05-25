module aes32_encrypt
  import cv32e40p_pkg::*;
  import aes_pkg::*;
#()
(
  input logic clk_i,
  input logic rst_ni,
  input logic enable_i,                // high when we can start encrypting
  input logic ex_ready_i,              // transition back to IDLE when high (when the result can be latched)
  input logic [127:0] plaintext_i,
  input logic [127:0] round_key_i,     // initial round key loaded by aes32_load

  output logic ready_o,                // high when we're done with encryption
  output logic [127:0] ciphertext_o
);

// fsm states
typedef enum logic [2:0] {
  IDLE = 3'd0,
  INIT = 3'd1,
  SUBBYTES = 3'd2,
  MIXCOLUMNS = 3'd3,
  FINALROUND = 3'd4,
  DONE = 3'd5
} aes_state_e;

aes_state_e state_q, state_d;

logic [127:0] aes_block_q, aes_block_d;
logic [127:0] round_key_q, round_key_d;
logic [3:0] round_q, round_d;

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

  case (state_q)
    IDLE: begin
      // here we just wait for enable to be set
      ready_o = 1'b1; // just idle, so the pipeline can work on smth else

      if (enable_i ) begin
        aes_block_d = plaintext_i;
        round_key_d =  round_key_i;
        round_d = 4'd0;
        state_d = INIT;
      end
    end

    INIT: begin
      // this is just the initial add round key
      aes_block_d = aes_block_q ^ round_key_q;
      round_d = 4'd1;
      state_d = SUBBYTES;
    end

    SUBBYTES: begin
    end

    MIXCOLUMNS: begin
    end

    FINALROUND: begin
    end

    DONE: begin
      ready_o = 1'd1;

      // if the result is ready to be latched then go back to idle
      if (ex_ready_i) begin
        state_d = IDLE;
      end
    end
  endcase
end

assign ciphertext_o = aes_block_q;

endmodule