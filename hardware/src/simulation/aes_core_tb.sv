`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2026 09:14:53
// Design Name: 
// Module Name: tb_aes_core-load
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


module tb_cv32e40p_aes_load;

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

  // ------------------------------------------------------------
  // DUT
  // ------------------------------------------------------------
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

  // ------------------------------------------------------------
  // Clock
  // ------------------------------------------------------------
  initial clk = 1'b0;
  always #5 clk = ~clk;

  // ------------------------------------------------------------
  // Instruction encoder
  // AES_LOAD: I-type
  // imm[31:20], rs1[19:15], funct3=000, rd[11:7], opcode=0x1b
  // ------------------------------------------------------------
  function automatic logic [31:0] enc_aes_load(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
  );
    enc_aes_load = {imm, rs1, 3'b000, rd, 7'h1b};

  endfunction
  function automatic logic [31:0] enc_aes_encrypt(
  );
    enc_aes_encrypt = {25'd0, 7'h6b};
  endfunction

  function automatic logic [31:0] enc_aes_store(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
  );
    enc_aes_store = {imm, rs1, 3'b000, rd, 7'h3b};
  endfunction

  function automatic logic [31:0] enc_nop();
    enc_nop = 32'h0000_0013; // addi x0, x0, 0
  endfunction

  // ------------------------------------------------------------
  // Simple instruction memory: zero-wait response
  // ------------------------------------------------------------
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

  // ------------------------------------------------------------
  // Simple data memory: 1-cycle read response
  // ------------------------------------------------------------
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

      data_rvalid <= data_req_q && !data_we_q;

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

  // ------------------------------------------------------------
  // Debug monitors
  // ------------------------------------------------------------
  always_ff @(posedge clk) begin
    if (dut.aes_mem_we_wb) begin
      $display("[%0t] AES_MEM_WRITE slot=%0d data=%08h reg_waddr=%0d",
               $time,
               dut.aes_ws_wb,
               dut.aes_wb_data,
               dut.regfile_waddr_fw_wb_o);
    end
  end

  always_ff @(posedge clk) begin
    if (data_rvalid) begin
      $display("[%0t] LSU_RETURN addr=%08h data=%08h regfile_wdata=%08h",
               $time,
               data_addr_q,
               data_rdata,
               dut.regfile_wdata);
    end
  end

  // ------------------------------------------------------------
  // Test sequence
  // ------------------------------------------------------------
  initial begin
    integer i;

    for (i = 0; i < 256; i++) begin
      imem[i] = enc_nop();
      dmem[i] = 32'h0;
    end

    // Data memory contents loaded by AES_LOAD
    //
    dmem[0] = 32'h6C6C6548;  // H e l l
    dmem[1] = 32'h57202C6F;  // o , ' ' W
    dmem[2] = 32'h646C726F;  // o r l d
    dmem[3] = 32'h30303021;  // ! 0 0 0
    //
    dmem[4] = 32'h65736563;  // c e s e
    dmem[5] = 32'h30343034;  // 4 0 4 0
    dmem[6] = 32'h73736170;  // p a s s
    dmem[7] = 32'h64726F77;  // w o r d

    // dmem[0] = 32'h48656C6C;  // H e l l
    // dmem[1] = 32'h6F2C2057;  // o , ' ' W
    // dmem[2] = 32'h6F726C64;  // o r l d
    // dmem[3] = 32'h21303030;  // ! 0 0 0
    //
    // dmem[4] = 32'h63657365;  // c e s e
    // dmem[5] = 32'h34303430;  // 4 0 4 0
    // dmem[6] = 32'h70617373;  // p a s s
    // dmem[7] = 32'h776F7264;  // w o r d

    // AES_LOAD rd, offset(x0)
    // rd[2:0] selects AES memory slot
    imem[0] = enc_aes_load(5'd0, 5'd0, 12'd0);
    imem[1] = enc_aes_load(5'd1, 5'd0, 12'd4);
    imem[2] = enc_aes_load(5'd2, 5'd0, 12'd8);
    imem[3] = enc_aes_load(5'd3, 5'd0, 12'd12);

    imem[4] = enc_aes_load(5'd4, 5'd0, 12'd16);
    imem[5] = enc_aes_load(5'd5, 5'd0, 12'd20);
    imem[6] = enc_aes_load(5'd6, 5'd0, 12'd24);
    imem[7] = enc_aes_load(5'd7, 5'd0, 12'd28);

    imem[8] = enc_nop();

    // perform encryption
    imem[9] = enc_aes_encrypt();

    //
    // // store the memory
    imem[10] = enc_aes_store(5'd0, 5'd0, 12'd32); 
    imem[11] = enc_aes_store(5'd1, 5'd0, 12'd36); 
    imem[12] = enc_aes_store(5'd2, 5'd0, 12'd40); 
    imem[13] = enc_aes_store(5'd3, 5'd0, 12'd44); 

    rst_n = 1'b0;
    fetch_enable = 1'b0;

    repeat (5) @(posedge clk);

    rst_n = 1'b1;
    fetch_enable = 1'b1;

    repeat (200) @(posedge clk);

    $display("FINAL AES_STATE = %032h", dut.aes_state);
    $display("FINAL AES_KEY   = %032h", dut.aes_key);

    if (dut.aes_state !== 128'h4444_4444_3333_3333_2222_2222_1111_1111) begin
      $error("AES_STATE mismatch!");
    end else begin
      $display("AES_STATE OK");
    end

    if (dut.aes_key !== 128'hDDDD_DDDD_CCCC_CCCC_BBBB_BBBB_AAAA_AAAA) begin
      $error("AES_KEY mismatch!");
    end else begin
      $display("AES_KEY OK");
    end

    $finish;
  end

endmodule
