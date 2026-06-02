let DecoderNamespace = "AES" in {
// I-type: AES_LOAD  rd, offset(rs1)
let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
def AES_LOAD : RVInst<(outs), (ins GPR:$rs1, simm12_lo:$imm12, GPR:$rd),
                       "aes.load", "$rd, ${imm12}(${rs1})",
                       [], InstFormatI> {
  bits<5>  rd;
  bits<5>  rs1;
  bits<12> imm12;

  let Inst{31-20} = imm12;
  let Inst{19-15} = rs1;
  let Inst{14-12} = 0b000;
  let Inst{11-7}  = rd;
  let Inst{6-0}   = 0x1b;  // 7-bit custom opcode
}

// I-type: AES_STORE  rd, offset(rs1)
let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
def AES_STORE : RVInst<(outs), (ins GPR:$rs1, simm12_lo:$imm12, GPR:$rd),
                       "aes.store", "$rd, ${imm12}(${rs1})",
                       [], InstFormatI> {
  bits<5>  rd;
  bits<5>  rs1;
  bits<12> imm12;

  let Inst{31-20} = imm12;
  let Inst{19-15} = rs1;
  let Inst{14-12} = 0b000;
  let Inst{11-7}  = rd;
  let Inst{6-0}   = 0x3b;  // 7-bit custom opcode
}

// R-type (no operands beyond opcode): AES_ENCRYPT
let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
def AES_ENCRYPT : RVInst<(outs), (ins),
                           "aes.encrypt", "",
                           [], InstFormatR> {
  let Inst{31-7} = 0;
  let Inst{6-0}  = 0x6b;
}

}
