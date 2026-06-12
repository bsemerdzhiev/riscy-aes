`timescale 1ns / 1ps
module tb_cv32e40p_aes_kat;

  logic clk;
  logic rst_n;

  logic instr_req;
  logic instr_gnt;
  logic instr_rvalid;
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;

  logic data_req;
  logic data_gnt;
  logic data_rvalid;
  logic data_we;
  logic [3:0] data_be;
  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;

  logic fetch_enable;

  logic [31:0] imem [0:255];
  logic [31:0] dmem [0:255];

  localparam logic [31:0] PT0 = 32'h33221100, PT1 = 32'h77665544,
                          PT2 = 32'hbbaa9988, PT3 = 32'hffeeddcc;
  localparam logic [31:0] KW0 = 32'h03020100, KW1 = 32'h07060504,
                          KW2 = 32'h0b0a0908, KW3 = 32'h0f0e0d0c;
  localparam logic [31:0] CT0 = 32'hd8e0c469, CT1 = 32'h30047b6a,
                          CT2 = 32'h80b7cdd8, CT3 = 32'h5ac5b470;

  cv32e40p_core dut (
    .clk_i(clk),
    .rst_ni(rst_n),

    .pulp_clock_en_i(1'b1),
    .scan_cg_en_i(1'b0),

    .boot_addr_i(32'h0000_0000),
    .mtvec_addr_i(32'h0000_0100),
    .dm_halt_addr_i(32'h0000_0200),
    .hart_id_i(32'h0000_0000),
    .dm_exception_addr_i(32'h0000_0300),

    .instr_req_o(instr_req),
    .instr_gnt_i(instr_gnt),
    .instr_rvalid_i(instr_rvalid),
    .instr_addr_o(instr_addr),
    .instr_rdata_i(instr_rdata),

    .data_req_o(data_req),
    .data_gnt_i(data_gnt),
    .data_rvalid_i(data_rvalid),
    .data_we_o(data_we),
    .data_be_o(data_be),
    .data_addr_o(data_addr),
    .data_wdata_o(data_wdata),
    .data_rdata_i(data_rdata),

    .apu_req_o(),
    .apu_gnt_i(1'b0),
    .apu_operands_o(),
    .apu_op_o(),
    .apu_flags_o(),
    .apu_rvalid_i(1'b0),
    .apu_result_i(32'h0),
    .apu_flags_i('0),

    .irq_i(32'h0),
    .irq_ack_o(),
    .irq_id_o(),

    .debug_req_i(1'b0),
    .debug_havereset_o(),
    .debug_running_o(),
    .debug_halted_o(),

    .fetch_enable_i(fetch_enable),
    .core_sleep_o()
  );

  initial clk = 1'b0;
  always #5 clk = ~clk;

  function automatic logic [31:0] enc_aes_load(
    input logic [4:0] rd, input logic [4:0] rs1, input logic [11:0] imm);
    enc_aes_load = {imm, rs1, 3'b000, rd, 7'h1b};
  endfunction

  function automatic logic [31:0] enc_aes_store(
    input logic [4:0] rd, input logic [4:0] rs1, input logic [11:0] imm);
    enc_aes_store = {imm, rs1, 3'b000, rd, 7'h3b};
  endfunction

  function automatic logic [31:0] enc_aes_encrypt();
    enc_aes_encrypt = {17'd0, 3'b000, 5'd0, 7'h6b}; // funct3=000
  endfunction

  function automatic logic [31:0] enc_aes_decrypt();
    enc_aes_decrypt = {17'd0, 3'b001, 5'd0, 7'h6b}; // funct3=001
  endfunction

  function automatic logic [31:0] enc_nop();
    enc_nop = 32'h0000_0013; // addi x0, x0, 0
  endfunction

  assign instr_gnt = instr_req;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      instr_rvalid <= 1'b0;
      instr_rdata  <= 32'h0;
    end else begin
      instr_rvalid <= instr_req;
      if (instr_req)
        instr_rdata <= imem[instr_addr[9:2]];
    end
  end

  assign data_gnt = data_req;

  logic data_req_q;
  logic data_we_q;
  logic [31:0] data_addr_q;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_req_q   <= 1'b0;
      data_we_q    <= 1'b0;
      data_addr_q  <= 32'h0;
      data_rvalid  <= 1'b0;
      data_rdata   <= 32'h0;
    end else begin
      data_req_q  <= data_req;
      data_we_q   <= data_we;
      data_addr_q <= data_addr;

      data_rvalid <= data_req_q; // read AND write get one rvalid

      if (data_req_q && !data_we_q)
        data_rdata <= dmem[data_addr_q[9:2]];

      if (data_req && data_we) begin
        if (data_be[0]) dmem[data_addr[9:2]][7:0]   <= data_wdata[7:0];
        if (data_be[1]) dmem[data_addr[9:2]][15:8]  <= data_wdata[15:8];
        if (data_be[2]) dmem[data_addr[9:2]][23:16] <= data_wdata[23:16];
        if (data_be[3]) dmem[data_addr[9:2]][31:24] <= data_wdata[31:24];
      end
    end
  end

  integer errors;

  task automatic check_block(
    input string label,
    input logic [31:0] g0, g1, g2, g3,
    input logic [31:0] e0, e1, e2, e3);
    $display("%s expected: %08h %08h %08h %08h", label, e0, e1, e2, e3);
    $display("%s got:      %08h %08h %08h %08h", label, g0, g1, g2, g3);
    if (g0 === e0 && g1 === e1 && g2 === e2 && g3 === e3)
      $display("  -> %s PASS", label);
    else begin
      $display("  -> %s FAIL", label);
      errors = errors + 1;
    end
  endtask

  initial begin
    integer i;
    errors = 0;

    for (i = 0; i < 256; i++) begin
      imem[i] = enc_nop();
      dmem[i] = 32'h0;
    end

    // Data: plaintext @0, key @16, ciphertext @64
    dmem[0]  = PT0; dmem[1]  = PT1; dmem[2]  = PT2; dmem[3]  = PT3;
    dmem[4]  = KW0; dmem[5]  = KW1; dmem[6]  = KW2; dmem[7]  = KW3;
    dmem[16] = CT0; dmem[17] = CT1; dmem[18] = CT2; dmem[19] = CT3;

    // Phase 1: KAT encrypt
    imem[0] = enc_aes_load(5'd0, 5'd0, 12'd0);   // state slots <- plaintext
    imem[1] = enc_aes_load(5'd1, 5'd0, 12'd4);
    imem[2] = enc_aes_load(5'd2, 5'd0, 12'd8);
    imem[3] = enc_aes_load(5'd3, 5'd0, 12'd12);
    imem[4] = enc_aes_load(5'd4, 5'd0, 12'd16);  // key slots <- key
    imem[5] = enc_aes_load(5'd5, 5'd0, 12'd20);
    imem[6] = enc_aes_load(5'd6, 5'd0, 12'd24);
    imem[7] = enc_aes_load(5'd7, 5'd0, 12'd28);

    imem[8] = enc_nop();

    imem[9] = enc_aes_encrypt();
    imem[10] = enc_aes_store(5'd0, 5'd0, 12'd32); // ciphertext -> dmem[8..11]
    imem[11] = enc_aes_store(5'd1, 5'd0, 12'd36);
    imem[12] = enc_aes_store(5'd2, 5'd0, 12'd40);
    imem[13] = enc_aes_store(5'd3, 5'd0, 12'd44);
    imem[14] = enc_nop();

    // Phase 2: KAT decrypt
    imem[15] = enc_aes_load(5'd0, 5'd0, 12'd64); // state slots <- ciphertext
    imem[16] = enc_aes_load(5'd1, 5'd0, 12'd68);
    imem[17] = enc_aes_load(5'd2, 5'd0, 12'd72);
    imem[18] = enc_aes_load(5'd3, 5'd0, 12'd76);
    imem[19] = enc_aes_load(5'd4, 5'd0, 12'd16); // key slots <- key (reloaded)
    imem[20] = enc_aes_load(5'd5, 5'd0, 12'd20);
    imem[21] = enc_aes_load(5'd6, 5'd0, 12'd24);
    imem[22] = enc_aes_load(5'd7, 5'd0, 12'd28);
    imem[23] = enc_nop();
    imem[24] = enc_aes_decrypt();
    imem[25] = enc_aes_store(5'd0, 5'd0, 12'd48); // plaintext -> dmem[12..15]
    imem[26] = enc_aes_store(5'd1, 5'd0, 12'd52);
    imem[27] = enc_aes_store(5'd2, 5'd0, 12'd56);
    imem[28] = enc_aes_store(5'd3, 5'd0, 12'd60);
    imem[29] = enc_nop();

    rst_n = 1'b0;
    fetch_enable = 1'b0;
    repeat (5) @(posedge clk);
    rst_n = 1'b1;
    fetch_enable = 1'b1;

    repeat (1000) @(posedge clk);

    $display("==== AES-128 KAT (FIPS-197 C.1) ====");
    check_block("ENC ", dmem[8],  dmem[9],  dmem[10], dmem[11], CT0, CT1, CT2, CT3);
    check_block("DEC ", dmem[12], dmem[13], dmem[14], dmem[15], PT0, PT1, PT2, PT3);

    if (errors == 0)
      $display("AES KAT TEST PASSED");
    else
      $error("AES KAT TEST FAILED (%0d block mismatch)", errors);

    $finish;
  end

endmodule
