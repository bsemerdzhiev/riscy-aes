
output/soft.elf:	file format elf32-littleriscv

Disassembly of section .vectors:

00008000 <.vectors>:
    8000: 13 00 00 00  	nop
    8004: 13 00 00 00  	nop
    8008: 13 00 00 00  	nop
    800c: 13 00 00 00  	nop
    8010: 13 00 00 00  	nop
    8014: 13 00 00 00  	nop
    8018: 13 00 00 00  	nop
    801c: 13 00 00 00  	nop
    8020: 13 00 00 00  	nop
    8024: 13 00 00 00  	nop
    8028: 13 00 00 00  	nop
    802c: 13 00 00 00  	nop
    8030: 13 00 00 00  	nop
    8034: 13 00 00 00  	nop
    8038: 13 00 00 00  	nop
    803c: 13 00 00 00  	nop
    8040: 13 00 00 00  	nop
    8044: 13 00 00 00  	nop
    8048: 13 00 00 00  	nop
    804c: 13 00 00 00  	nop
    8050: 13 00 00 00  	nop
    8054: 13 00 00 00  	nop
    8058: 13 00 00 00  	nop
    805c: 6f 00 40 09  	j	0x80f0 <ISR_I2C_ASM>
    8060: 6f 00 20 0a  	j	0x8102 <ISR_UART_ASM>
    8064: 6f 00 00 0b  	j	0x8114 <ISR_GPIO_ASM>
    8068: 6f 00 e0 0b  	j	0x8126 <ISR_SPIM0_ASM>
    806c: 6f 00 c0 0c  	j	0x8138 <ISR_SPIM1_ASM>
    8070: 6f 00 c0 0e  	j	0x815c <ISR_TA_OVF_ASM>
    8074: 6f 00 60 0d  	j	0x814a <ISR_TA_CMP_ASM>
    8078: 6f 00 80 10  	j	0x8180 <ISR_TB_OVF_ASM>
    807c: 6f 00 20 0f  	j	0x816e <ISR_TB_CMP_ASM>
    8080: 6f 00 c0 00  	j	0x808c <reset_handler>
    8084: 6f 00 e0 10  	j	0x8192 <illegal_insn_handler>
    8088: 6f 00 c0 11  	j	0x81a4 <ecall_insn_handler>

Disassembly of section .text:

0000808c <reset_handler>:
    808c: 81 40        	li	ra, 0x0
    808e: 06 81        	mv	sp, ra
    8090: 86 81        	mv	gp, ra
    8092: 06 82        	mv	tp, ra
    8094: 86 82        	mv	t0, ra
    8096: 06 83        	mv	t1, ra
    8098: 86 83        	mv	t2, ra
    809a: 06 84        	mv	s0, ra
    809c: 86 84        	mv	s1, ra
    809e: 06 85        	mv	a0, ra
    80a0: 86 85        	mv	a1, ra
    80a2: 06 86        	mv	a2, ra
    80a4: 86 86        	mv	a3, ra
    80a6: 06 87        	mv	a4, ra
    80a8: 86 87        	mv	a5, ra
    80aa: 06 88        	mv	a6, ra
    80ac: 86 88        	mv	a7, ra
    80ae: 06 89        	mv	s2, ra
    80b0: 86 89        	mv	s3, ra
    80b2: 06 8a        	mv	s4, ra
    80b4: 86 8a        	mv	s5, ra
    80b6: 06 8b        	mv	s6, ra
    80b8: 86 8b        	mv	s7, ra
    80ba: 06 8c        	mv	s8, ra
    80bc: 86 8c        	mv	s9, ra
    80be: 06 8d        	mv	s10, ra
    80c0: 86 8d        	mv	s11, ra
    80c2: 06 8e        	mv	t3, ra
    80c4: 86 8e        	mv	t4, ra
    80c6: 06 8f        	mv	t5, ra
    80c8: 86 8f        	mv	t6, ra
    80ca: 17 01 10 00  	auipc	sp, 0x100
    80ce: 13 01 61 f3  	addi	sp, sp, -0xca

000080d2 <_start>:
    80d2: 63 57 bd 01  	bge	s10, s11, 0x80e0 <zero_loop_end>

000080d6 <zero_loop>:
    80d6: 23 20 0d 00  	sw	zero, 0x0(s10)
    80da: 11 0d        	addi	s10, s10, 0x4
    80dc: e3 dd ad ff  	bge	s11, s10, 0x80d6 <zero_loop>

000080e0 <zero_loop_end>:
    80e0: 01 45        	li	a0, 0x0
    80e2: 81 45        	li	a1, 0x0
    80e4: ef 00 80 7d  	jal	0x88bc <main>
    80e8: 2a 84        	mv	s0, a0
    80ea: 22 85        	mv	a0, s0
    80ec: ef 00 40 21  	jal	0x8300 <exit>

000080f0 <ISR_I2C_ASM>:
    80f0: 1d 71        	addi	sp, sp, -0x60
    80f2: 86 ce        	sw	ra, 0x5c(sp)
    80f4: c9 20        	jal	0x81b6 <store_regs>
    80f6: 97 00 00 00  	auipc	ra, 0x0
    80fa: 93 80 80 10  	addi	ra, ra, 0x108
    80fe: 6f 00 60 16  	j	0x8264 <ISR_I2C>

00008102 <ISR_UART_ASM>:
    8102: 1d 71        	addi	sp, sp, -0x60
    8104: 86 ce        	sw	ra, 0x5c(sp)
    8106: 45 28        	jal	0x81b6 <store_regs>
    8108: 97 00 00 00  	auipc	ra, 0x0
    810c: 93 80 60 0f  	addi	ra, ra, 0xf6
    8110: 6f 00 60 15  	j	0x8266 <ISR_UART>

00008114 <ISR_GPIO_ASM>:
    8114: 1d 71        	addi	sp, sp, -0x60
    8116: 86 ce        	sw	ra, 0x5c(sp)
    8118: 79 28        	jal	0x81b6 <store_regs>
    811a: 97 00 00 00  	auipc	ra, 0x0
    811e: 93 80 40 0e  	addi	ra, ra, 0xe4
    8122: 6f 00 60 14  	j	0x8268 <ISR_GPIO>

00008126 <ISR_SPIM0_ASM>:
    8126: 1d 71        	addi	sp, sp, -0x60
    8128: 86 ce        	sw	ra, 0x5c(sp)
    812a: 71 20        	jal	0x81b6 <store_regs>
    812c: 97 00 00 00  	auipc	ra, 0x0
    8130: 93 80 20 0d  	addi	ra, ra, 0xd2
    8134: 6f 00 60 13  	j	0x826a <ISR_SPIM0>

00008138 <ISR_SPIM1_ASM>:
    8138: 1d 71        	addi	sp, sp, -0x60
    813a: 86 ce        	sw	ra, 0x5c(sp)
    813c: ad 28        	jal	0x81b6 <store_regs>
    813e: 97 00 00 00  	auipc	ra, 0x0
    8142: 93 80 00 0c  	addi	ra, ra, 0xc0
    8146: 6f 00 60 12  	j	0x826c <ISR_SPIM1>

0000814a <ISR_TA_CMP_ASM>:
    814a: 1d 71        	addi	sp, sp, -0x60
    814c: 86 ce        	sw	ra, 0x5c(sp)
    814e: a5 20        	jal	0x81b6 <store_regs>
    8150: 97 00 00 00  	auipc	ra, 0x0
    8154: 93 80 e0 0a  	addi	ra, ra, 0xae
    8158: 6f 00 80 11  	j	0x8270 <ISR_TA_CMP>

0000815c <ISR_TA_OVF_ASM>:
    815c: 1d 71        	addi	sp, sp, -0x60
    815e: 86 ce        	sw	ra, 0x5c(sp)
    8160: 99 28        	jal	0x81b6 <store_regs>
    8162: 97 00 00 00  	auipc	ra, 0x0
    8166: 93 80 c0 09  	addi	ra, ra, 0x9c
    816a: 6f 00 40 10  	j	0x826e <ISR_TA_OVF>

0000816e <ISR_TB_CMP_ASM>:
    816e: 1d 71        	addi	sp, sp, -0x60
    8170: 86 ce        	sw	ra, 0x5c(sp)
    8172: 91 20        	jal	0x81b6 <store_regs>
    8174: 97 00 00 00  	auipc	ra, 0x0
    8178: 93 80 a0 08  	addi	ra, ra, 0x8a
    817c: 6f 00 80 0f  	j	0x8274 <ISR_TB_CMP>

00008180 <ISR_TB_OVF_ASM>:
    8180: 1d 71        	addi	sp, sp, -0x60
    8182: 86 ce        	sw	ra, 0x5c(sp)
    8184: 0d 28        	jal	0x81b6 <store_regs>
    8186: 97 00 00 00  	auipc	ra, 0x0
    818a: 93 80 80 07  	addi	ra, ra, 0x78
    818e: 6f 00 40 0e  	j	0x8272 <ISR_TB_OVF>

00008192 <illegal_insn_handler>:
    8192: 1d 71        	addi	sp, sp, -0x60
    8194: 86 ce        	sw	ra, 0x5c(sp)
    8196: 05 20        	jal	0x81b6 <store_regs>
    8198: 97 00 00 00  	auipc	ra, 0x0
    819c: 93 80 60 06  	addi	ra, ra, 0x66
    81a0: 6f 00 00 0c  	j	0x8260 <illegal_insn_handler_c>

000081a4 <ecall_insn_handler>:
    81a4: 1d 71        	addi	sp, sp, -0x60
    81a6: 86 ce        	sw	ra, 0x5c(sp)
    81a8: 39 20        	jal	0x81b6 <store_regs>
    81aa: 97 00 00 00  	auipc	ra, 0x0
    81ae: 93 80 40 05  	addi	ra, ra, 0x54
    81b2: 6f 00 00 0b  	j	0x8262 <ecall_insn_handler_c>

000081b6 <store_regs>:
    81b6: 0e c0        	sw	gp, 0x0(sp)
    81b8: 12 c2        	sw	tp, 0x4(sp)
    81ba: 16 c4        	sw	t0, 0x8(sp)
    81bc: 1a c6        	sw	t1, 0xc(sp)
    81be: 1e c8        	sw	t2, 0x10(sp)
    81c0: 2a ca        	sw	a0, 0x14(sp)
    81c2: 2e cc        	sw	a1, 0x18(sp)
    81c4: 32 ce        	sw	a2, 0x1c(sp)
    81c6: 36 d0        	sw	a3, 0x20(sp)
    81c8: 3a d2        	sw	a4, 0x24(sp)
    81ca: 3e d4        	sw	a5, 0x28(sp)
    81cc: 42 d6        	sw	a6, 0x2c(sp)
    81ce: 46 d8        	sw	a7, 0x30(sp)
    81d0: 72 da        	sw	t3, 0x34(sp)
    81d2: 76 dc        	sw	t4, 0x38(sp)
    81d4: 7a de        	sw	t5, 0x3c(sp)
    81d6: fe c0        	sw	t6, 0x40(sp)
    81d8: 73 2e 00 7b  	csrr	t3, dcsr
    81dc: f3 2e 10 7b  	csrr	t4, dpc
    81e0: 73 2f 20 7b  	csrr	t5, dscratch0
    81e4: f2 c2        	sw	t3, 0x44(sp)
    81e6: f6 c4        	sw	t4, 0x48(sp)
    81e8: fa c6        	sw	t5, 0x4c(sp)
    81ea: 73 2e 40 7b  	csrr	t3, 0x7b4
    81ee: f3 2e 50 7b  	csrr	t4, 0x7b5
    81f2: 73 2f 60 7b  	csrr	t5, 0x7b6
    81f6: f2 c8        	sw	t3, 0x50(sp)
    81f8: f6 ca        	sw	t4, 0x54(sp)
    81fa: fa cc        	sw	t5, 0x58(sp)
    81fc: 82 80        	ret

000081fe <end_except>:
    81fe: 46 4e        	lw	t3, 0x50(sp)
    8200: d6 4e        	lw	t4, 0x54(sp)
    8202: 66 4f        	lw	t5, 0x58(sp)
    8204: 73 10 4e 7b  	csrw	0x7b4, t3
    8208: 73 90 5e 7b  	csrw	0x7b5, t4
    820c: 73 10 6f 7b  	csrw	0x7b6, t5
    8210: 16 4e        	lw	t3, 0x44(sp)
    8212: a6 4e        	lw	t4, 0x48(sp)
    8214: 36 4f        	lw	t5, 0x4c(sp)
    8216: 73 10 0e 7b  	csrw	dcsr, t3
    821a: 73 90 1e 7b  	csrw	dpc, t4
    821e: 73 10 2f 7b  	csrw	dscratch0, t5
    8222: 82 41        	lw	gp, 0x0(sp)
    8224: 12 42        	lw	tp, 0x4(sp)
    8226: a2 42        	lw	t0, 0x8(sp)
    8228: 32 43        	lw	t1, 0xc(sp)
    822a: c2 43        	lw	t2, 0x10(sp)
    822c: 52 45        	lw	a0, 0x14(sp)
    822e: e2 45        	lw	a1, 0x18(sp)
    8230: 72 46        	lw	a2, 0x1c(sp)
    8232: 82 56        	lw	a3, 0x20(sp)
    8234: 12 57        	lw	a4, 0x24(sp)
    8236: a2 57        	lw	a5, 0x28(sp)
    8238: 32 58        	lw	a6, 0x2c(sp)
    823a: c2 58        	lw	a7, 0x30(sp)
    823c: 52 5e        	lw	t3, 0x34(sp)
    823e: e2 5e        	lw	t4, 0x38(sp)
    8240: 72 5f        	lw	t5, 0x3c(sp)
    8242: 86 4f        	lw	t6, 0x40(sp)
    8244: f6 40        	lw	ra, 0x5c(sp)
    8246: 25 61        	addi	sp, sp, 0x60
    8248: 73 00 20 30  	mret

0000824c <_init>:
    824c: 82 80        	ret

0000824e <_etext>:
		...

00008256 <__DTOR_LIST__>:
		...

Disassembly of section .text.default_exception_handler_c:

0000825e <default_exception_handler_c>:
    825e: 01 a0        	j	0x825e <default_exception_handler_c>

Disassembly of section .text.illegal_insn_handler_c:

00008260 <illegal_insn_handler_c>:
    8260: 01 a0        	j	0x8260 <illegal_insn_handler_c>

Disassembly of section .text.ecall_insn_handler_c:

00008262 <ecall_insn_handler_c>:
    8262: 01 a0        	j	0x8262 <ecall_insn_handler_c>

Disassembly of section .text.ISR_I2C:

00008264 <ISR_I2C>:
    8264: 01 a0        	j	0x8264 <ISR_I2C>

Disassembly of section .text.ISR_UART:

00008266 <ISR_UART>:
    8266: 01 a0        	j	0x8266 <ISR_UART>

Disassembly of section .text.ISR_GPIO:

00008268 <ISR_GPIO>:
    8268: 01 a0        	j	0x8268 <ISR_GPIO>

Disassembly of section .text.ISR_SPIM0:

0000826a <ISR_SPIM0>:
    826a: 01 a0        	j	0x826a <ISR_SPIM0>

Disassembly of section .text.ISR_SPIM1:

0000826c <ISR_SPIM1>:
    826c: 01 a0        	j	0x826c <ISR_SPIM1>

Disassembly of section .text.ISR_TA_OVF:

0000826e <ISR_TA_OVF>:
    826e: 01 a0        	j	0x826e <ISR_TA_OVF>

Disassembly of section .text.ISR_TA_CMP:

00008270 <ISR_TA_CMP>:
    8270: 01 a0        	j	0x8270 <ISR_TA_CMP>

Disassembly of section .text.ISR_TB_OVF:

00008272 <ISR_TB_OVF>:
    8272: 01 a0        	j	0x8272 <ISR_TB_OVF>

Disassembly of section .text.ISR_TB_CMP:

00008274 <ISR_TB_CMP>:
    8274: 01 a0        	j	0x8274 <ISR_TB_CMP>

Disassembly of section .text._copy:

00008276 <_copy>:
    8276: 41 11        	addi	sp, sp, -0x10
    8278: 06 c6        	sw	ra, 0xc(sp)
    827a: 22 c4        	sw	s0, 0x8(sp)
    827c: 63 f4 d5 00  	bgeu	a1, a3, 0x8284 <_copy+0xe>
    8280: 01 44        	li	s0, 0x0
    8282: 29 a0        	j	0x828c <_copy+0x16>
    8284: 36 84        	mv	s0, a3
    8286: b2 85        	mv	a1, a2
    8288: 36 86        	mv	a2, a3
    828a: a9 28        	jal	0x82e4 <memcpy>
    828c: 22 85        	mv	a0, s0
    828e: b2 40        	lw	ra, 0xc(sp)
    8290: 22 44        	lw	s0, 0x8(sp)
    8292: 41 01        	addi	sp, sp, 0x10
    8294: 82 80        	ret

Disassembly of section .text._set:

00008296 <_set>:
    8296: 25 a8        	j	0x82ce <memset>

Disassembly of section .text._double_byte:

00008298 <_double_byte>:
    8298: 93 15 85 01  	slli	a1, a0, 0x18
    829c: 06 05        	slli	a0, a0, 0x1
    829e: fd 85        	srai	a1, a1, 0x1f
    82a0: ed 89        	andi	a1, a1, 0x1b
    82a2: 2d 8d        	xor	a0, a0, a1
    82a4: 13 75 f5 0f  	andi	a0, a0, 0xff
    82a8: 82 80        	ret

Disassembly of section .text._compare:

000082aa <_compare>:
    82aa: 05 c2        	beqz	a2, 0x82ca <_compare+0x20>
    82ac: 81 46        	li	a3, 0x0
    82ae: 2e 96        	add	a2, a2, a1
    82b0: 03 47 05 00  	lbu	a4, 0x0(a0)
    82b4: 83 c7 05 00  	lbu	a5, 0x0(a1)
    82b8: 85 05        	addi	a1, a1, 0x1
    82ba: 3d 8f        	xor	a4, a4, a5
    82bc: d9 8e        	or	a3, a3, a4
    82be: 05 05        	addi	a0, a0, 0x1
    82c0: e3 98 c5 fe  	bne	a1, a2, 0x82b0 <_compare+0x6>
    82c4: 13 f5 f6 0f  	andi	a0, a3, 0xff
    82c8: 82 80        	ret
    82ca: 01 45        	li	a0, 0x0
    82cc: 82 80        	ret

Disassembly of section .text.memset:

000082ce <memset>:
    82ce: 11 ca        	beqz	a2, 0x82e2 <memset+0x14>
    82d0: 2a 96        	add	a2, a2, a0
    82d2: aa 86        	mv	a3, a0
    82d4: 13 87 16 00  	addi	a4, a3, 0x1
    82d8: 23 80 b6 00  	sb	a1, 0x0(a3)
    82dc: ba 86        	mv	a3, a4
    82de: e3 1b c7 fe  	bne	a4, a2, 0x82d4 <memset+0x6>
    82e2: 82 80        	ret

Disassembly of section .text.memcpy:

000082e4 <memcpy>:
    82e4: 09 ce        	beqz	a2, 0x82fe <memcpy+0x1a>
    82e6: 2a 96        	add	a2, a2, a0
    82e8: aa 86        	mv	a3, a0
    82ea: 03 c7 05 00  	lbu	a4, 0x0(a1)
    82ee: 85 05        	addi	a1, a1, 0x1
    82f0: 93 87 16 00  	addi	a5, a3, 0x1
    82f4: 23 80 e6 00  	sb	a4, 0x0(a3)
    82f8: be 86        	mv	a3, a5
    82fa: e3 98 c7 fe  	bne	a5, a2, 0x82ea <memcpy+0x6>
    82fe: 82 80        	ret

Disassembly of section .text.exit:

00008300 <exit>:
    8300: 01 a0        	j	0x8300 <exit>

Disassembly of section .text.eoc:

00008302 <eoc>:
    8302: 01 a0        	j	0x8302 <eoc>

Disassembly of section .text.sleep_busy:

00008304 <sleep_busy>:
    8304: 41 11        	addi	sp, sp, -0x10
    8306: 2a c6        	sw	a0, 0xc(sp)
    8308: 32 45        	lw	a0, 0xc(sp)
    830a: 63 58 a0 00  	blez	a0, 0x831a <sleep_busy+0x16>
    830e: 01 45        	li	a0, 0x0
    8310: 01 00        	nop
    8312: b2 45        	lw	a1, 0xc(sp)
    8314: 05 05        	addi	a0, a0, 0x1
    8316: e3 4d b5 fe  	blt	a0, a1, 0x8310 <sleep_busy+0xc>
    831a: 41 01        	addi	sp, sp, 0x10
    831c: 82 80        	ret

Disassembly of section .text.expand_key:

0000831e <expand_key>:
    831e: 41 11        	addi	sp, sp, -0x10
    8320: 22 c6        	sw	s0, 0xc(sp)
    8322: 13 86 05 01  	addi	a2, a1, 0x10
    8326: ae 86        	mv	a3, a1
    8328: 03 47 05 00  	lbu	a4, 0x0(a0)
    832c: 23 80 e6 00  	sb	a4, 0x0(a3)
    8330: 85 06        	addi	a3, a3, 0x1
    8332: 05 05        	addi	a0, a0, 0x1
    8334: e3 9a c6 fe  	bne	a3, a2, 0x8328 <expand_key+0xa>
    8338: 31 47        	li	a4, 0xc
    833a: b7 02 10 00  	lui	t0, 0x100
    833e: 93 82 02 00  	mv	t0, t0
    8342: 37 08 10 00  	lui	a6, 0x100
    8346: 13 08 08 10  	addi	a6, a6, 0x100
    834a: 93 08 c0 0a  	li	a7, 0xac
    834e: b3 87 e5 00  	add	a5, a1, a4
    8352: 03 c3 07 00  	lbu	t1, 0x0(a5)
    8356: 03 cf 17 00  	lbu	t5, 0x1(a5)
    835a: 83 ce 27 00  	lbu	t4, 0x2(a5)
    835e: 83 c3 37 00  	lbu	t2, 0x3(a5)
    8362: 11 07        	addi	a4, a4, 0x4
    8364: 93 76 c7 00  	andi	a3, a4, 0xc
    8368: 95 e6        	bnez	a3, 0x8394 <expand_key+0x76>
    836a: 33 86 e2 01  	add	a2, t0, t5
    836e: 33 85 d2 01  	add	a0, t0, t4
    8372: 96 93        	add	t2, t2, t0
    8374: 16 93        	add	t1, t1, t0
    8376: 93 56 47 00  	srli	a3, a4, 0x4
    837a: c2 96        	add	a3, a3, a6
    837c: 03 ce f6 ff  	lbu	t3, -0x1(a3)
    8380: 83 46 06 00  	lbu	a3, 0x0(a2)
    8384: 03 4f 05 00  	lbu	t5, 0x0(a0)
    8388: 83 ce 03 00  	lbu	t4, 0x0(t2)
    838c: 83 43 03 00  	lbu	t2, 0x0(t1)
    8390: 33 43 de 00  	xor	t1, t3, a3
    8394: 03 ce 47 ff  	lbu	t3, -0xc(a5)
    8398: 83 cf 57 ff  	lbu	t6, -0xb(a5)
    839c: 03 c4 67 ff  	lbu	s0, -0xa(a5)
    83a0: 83 c6 77 ff  	lbu	a3, -0x9(a5)
    83a4: 33 45 6e 00  	xor	a0, t3, t1
    83a8: 33 c6 ef 01  	xor	a2, t6, t5
    83ac: 33 44 d4 01  	xor	s0, s0, t4
    83b0: b3 c6 76 00  	xor	a3, a3, t2
    83b4: 23 82 a7 00  	sb	a0, 0x4(a5)
    83b8: a3 82 c7 00  	sb	a2, 0x5(a5)
    83bc: 23 83 87 00  	sb	s0, 0x6(a5)
    83c0: a3 83 d7 00  	sb	a3, 0x7(a5)
    83c4: e3 65 17 f9  	bltu	a4, a7, 0x834e <expand_key+0x30>
    83c8: 32 44        	lw	s0, 0xc(sp)
    83ca: 41 01        	addi	sp, sp, 0x10
    83cc: 82 80        	ret

Disassembly of section .text.sub_bytes:

000083ce <sub_bytes>:
    83ce: 93 05 05 01  	addi	a1, a0, 0x10
    83d2: 37 06 10 00  	lui	a2, 0x100
    83d6: 13 06 06 00  	mv	a2, a2
    83da: 83 46 05 00  	lbu	a3, 0x0(a0)
    83de: b2 96        	add	a3, a3, a2
    83e0: 83 c6 06 00  	lbu	a3, 0x0(a3)
    83e4: 23 00 d5 00  	sb	a3, 0x0(a0)
    83e8: 05 05        	addi	a0, a0, 0x1
    83ea: e3 18 b5 fe  	bne	a0, a1, 0x83da <sub_bytes+0xc>
    83ee: 82 80        	ret

Disassembly of section .text.shift_rows:

000083f0 <shift_rows>:
    83f0: 03 48 55 00  	lbu	a6, 0x5(a0)
    83f4: 83 48 65 00  	lbu	a7, 0x6(a0)
    83f8: 03 43 75 00  	lbu	t1, 0x7(a0)
    83fc: 83 4e 95 00  	lbu	t4, 0x9(a0)
    8400: 83 47 a5 00  	lbu	a5, 0xa(a0)
    8404: 83 42 b5 00  	lbu	t0, 0xb(a0)
    8408: 03 4e d5 00  	lbu	t3, 0xd(a0)
    840c: 83 45 e5 00  	lbu	a1, 0xe(a0)
    8410: 83 46 f5 00  	lbu	a3, 0xf(a0)
    8414: 83 43 15 00  	lbu	t2, 0x1(a0)
    8418: 03 46 25 00  	lbu	a2, 0x2(a0)
    841c: 03 47 35 00  	lbu	a4, 0x3(a0)
    8420: a3 00 05 01  	sb	a6, 0x1(a0)
    8424: 23 01 f5 00  	sb	a5, 0x2(a0)
    8428: a3 01 d5 00  	sb	a3, 0x3(a0)
    842c: a3 02 d5 01  	sb	t4, 0x5(a0)
    8430: 23 03 b5 00  	sb	a1, 0x6(a0)
    8434: a3 03 e5 00  	sb	a4, 0x7(a0)
    8438: a3 04 c5 01  	sb	t3, 0x9(a0)
    843c: 23 05 c5 00  	sb	a2, 0xa(a0)
    8440: a3 05 65 00  	sb	t1, 0xb(a0)
    8444: a3 06 75 00  	sb	t2, 0xd(a0)
    8448: 23 07 15 01  	sb	a7, 0xe(a0)
    844c: a3 07 55 00  	sb	t0, 0xf(a0)
    8450: 82 80        	ret

Disassembly of section .text.gf_mult:

00008452 <gf_mult>:
    8452: 01 46        	li	a2, 0x0
    8454: a1 46        	li	a3, 0x8
    8456: 13 97 f5 01  	slli	a4, a1, 0x1f
    845a: 93 17 85 01  	slli	a5, a0, 0x18
    845e: 7d 87        	srai	a4, a4, 0x1f
    8460: 69 8f        	and	a4, a4, a0
    8462: 06 05        	slli	a0, a0, 0x1
    8464: fd 16        	addi	a3, a3, -0x1
    8466: fd 87        	srai	a5, a5, 0x1f
    8468: ed 8b        	andi	a5, a5, 0x1b
    846a: 39 8e        	xor	a2, a2, a4
    846c: 3d 8d        	xor	a0, a0, a5
    846e: 85 81        	srli	a1, a1, 0x1
    8470: fd f2        	bnez	a3, 0x8456 <gf_mult+0x4>
    8472: 13 75 f6 0f  	andi	a0, a2, 0xff
    8476: 82 80        	ret

Disassembly of section .text.mix_columns:

00008478 <mix_columns>:
    8478: 79 71        	addi	sp, sp, -0x30
    847a: 06 d6        	sw	ra, 0x2c(sp)
    847c: 22 d4        	sw	s0, 0x28(sp)
    847e: 26 d2        	sw	s1, 0x24(sp)
    8480: 4a d0        	sw	s2, 0x20(sp)
    8482: 4e ce        	sw	s3, 0x1c(sp)
    8484: 01 4f        	li	t5, 0x0
    8486: 93 08 c1 00  	addi	a7, sp, 0xc
    848a: 11 48        	li	a6, 0x4
    848c: 81 46        	li	a3, 0x0
    848e: 93 1f 2f 00  	slli	t6, t5, 0x2
    8492: b3 05 f5 01  	add	a1, a0, t6
    8496: 03 c9 05 00  	lbu	s2, 0x0(a1)
    849a: 09 47        	li	a4, 0x2
    849c: 21 46        	li	a2, 0x8
    849e: ca 85        	mv	a1, s2
    84a0: 93 97 f5 01  	slli	a5, a1, 0x1f
    84a4: 93 14 87 01  	slli	s1, a4, 0x18
    84a8: fd 87        	srai	a5, a5, 0x1f
    84aa: f9 8f        	and	a5, a5, a4
    84ac: 06 07        	slli	a4, a4, 0x1
    84ae: e2 05        	slli	a1, a1, 0x18
    84b0: 7d 16        	addi	a2, a2, -0x1
    84b2: fd 84        	srai	s1, s1, 0x1f
    84b4: ed 88        	andi	s1, s1, 0x1b
    84b6: bd 8e        	xor	a3, a3, a5
    84b8: 25 8f        	xor	a4, a4, s1
    84ba: e5 81        	srli	a1, a1, 0x19
    84bc: 75 f2        	bnez	a2, 0x84a0 <mix_columns+0x28>
    84be: 01 47        	li	a4, 0x0
    84c0: 93 8e 1f 00  	addi	t4, t6, 0x1
    84c4: b3 05 d5 01  	add	a1, a0, t4
    84c8: 83 c3 05 00  	lbu	t2, 0x0(a1)
    84cc: 8d 45        	li	a1, 0x3
    84ce: 21 46        	li	a2, 0x8
    84d0: 9e 87        	mv	a5, t2
    84d2: 93 94 f7 01  	slli	s1, a5, 0x1f
    84d6: 13 94 85 01  	slli	s0, a1, 0x18
    84da: fd 84        	srai	s1, s1, 0x1f
    84dc: ed 8c        	and	s1, s1, a1
    84de: 86 05        	slli	a1, a1, 0x1
    84e0: e2 07        	slli	a5, a5, 0x18
    84e2: 7d 16        	addi	a2, a2, -0x1
    84e4: 7d 84        	srai	s0, s0, 0x1f
    84e6: 6d 88        	andi	s0, s0, 0x1b
    84e8: 25 8f        	xor	a4, a4, s1
    84ea: a1 8d        	xor	a1, a1, s0
    84ec: e5 83        	srli	a5, a5, 0x19
    84ee: 75 f2        	bnez	a2, 0x84d2 <mix_columns+0x5a>
    84f0: b9 8e        	xor	a3, a3, a4
    84f2: 13 83 2f 00  	addi	t1, t6, 0x2
    84f6: 93 82 3f 00  	addi	t0, t6, 0x3
    84fa: b3 05 65 00  	add	a1, a0, t1
    84fe: 33 07 55 00  	add	a4, a0, t0
    8502: 03 ce 05 00  	lbu	t3, 0x0(a1)
    8506: 83 49 07 00  	lbu	s3, 0x0(a4)
    850a: c6 9f        	add	t6, t6, a7
    850c: 09 47        	li	a4, 0x2
    850e: b3 c5 c6 01  	xor	a1, a3, t3
    8512: b3 c5 35 01  	xor	a1, a1, s3
    8516: 23 80 bf 00  	sb	a1, 0x0(t6)
    851a: a1 45        	li	a1, 0x8
    851c: 9e 87        	mv	a5, t2
    851e: 93 96 f7 01  	slli	a3, a5, 0x1f
    8522: 13 14 87 01  	slli	s0, a4, 0x18
    8526: fd 86        	srai	a3, a3, 0x1f
    8528: f9 8e        	and	a3, a3, a4
    852a: 06 07        	slli	a4, a4, 0x1
    852c: e2 07        	slli	a5, a5, 0x18
    852e: fd 15        	addi	a1, a1, -0x1
    8530: 7d 84        	srai	s0, s0, 0x1f
    8532: 6d 88        	andi	s0, s0, 0x1b
    8534: 35 8e        	xor	a2, a2, a3
    8536: 21 8f        	xor	a4, a4, s0
    8538: e5 83        	srli	a5, a5, 0x19
    853a: f5 f1        	bnez	a1, 0x851e <mix_columns+0xa6>
    853c: 8d 47        	li	a5, 0x3
    853e: 21 47        	li	a4, 0x8
    8540: 72 84        	mv	s0, t3
    8542: 93 16 f4 01  	slli	a3, s0, 0x1f
    8546: 93 94 87 01  	slli	s1, a5, 0x18
    854a: fd 86        	srai	a3, a3, 0x1f
    854c: fd 8e        	and	a3, a3, a5
    854e: 86 07        	slli	a5, a5, 0x1
    8550: 62 04        	slli	s0, s0, 0x18
    8552: 7d 17        	addi	a4, a4, -0x1
    8554: fd 84        	srai	s1, s1, 0x1f
    8556: ed 88        	andi	s1, s1, 0x1b
    8558: b5 8d        	xor	a1, a1, a3
    855a: a5 8f        	xor	a5, a5, s1
    855c: 65 80        	srli	s0, s0, 0x19
    855e: 75 f3        	bnez	a4, 0x8542 <mix_columns+0xca>
    8560: b3 c6 29 01  	xor	a3, s3, s2
    8564: 35 8e        	xor	a2, a2, a3
    8566: c6 9e        	add	t4, t4, a7
    8568: b1 8d        	xor	a1, a1, a2
    856a: 09 46        	li	a2, 0x2
    856c: 23 80 be 00  	sb	a1, 0x0(t4)
    8570: a1 45        	li	a1, 0x8
    8572: f2 87        	mv	a5, t3
    8574: 93 96 f7 01  	slli	a3, a5, 0x1f
    8578: 93 14 86 01  	slli	s1, a2, 0x18
    857c: fd 86        	srai	a3, a3, 0x1f
    857e: f1 8e        	and	a3, a3, a2
    8580: 06 06        	slli	a2, a2, 0x1
    8582: e2 07        	slli	a5, a5, 0x18
    8584: fd 15        	addi	a1, a1, -0x1
    8586: fd 84        	srai	s1, s1, 0x1f
    8588: ed 88        	andi	s1, s1, 0x1b
    858a: 35 8f        	xor	a4, a4, a3
    858c: 25 8e        	xor	a2, a2, s1
    858e: e5 83        	srli	a5, a5, 0x19
    8590: f5 f1        	bnez	a1, 0x8574 <mix_columns+0xfc>
    8592: 01 46        	li	a2, 0x0
    8594: b3 ce 23 01  	xor	t4, t2, s2
    8598: 8d 47        	li	a5, 0x3
    859a: a1 45        	li	a1, 0x8
    859c: ce 86        	mv	a3, s3
    859e: 93 94 f6 01  	slli	s1, a3, 0x1f
    85a2: 13 94 87 01  	slli	s0, a5, 0x18
    85a6: fd 84        	srai	s1, s1, 0x1f
    85a8: fd 8c        	and	s1, s1, a5
    85aa: 86 07        	slli	a5, a5, 0x1
    85ac: e2 06        	slli	a3, a3, 0x18
    85ae: fd 15        	addi	a1, a1, -0x1
    85b0: 7d 84        	srai	s0, s0, 0x1f
    85b2: 6d 88        	andi	s0, s0, 0x1b
    85b4: 25 8e        	xor	a2, a2, s1
    85b6: a1 8f        	xor	a5, a5, s0
    85b8: e5 82        	srli	a3, a3, 0x19
    85ba: f5 f1        	bnez	a1, 0x859e <mix_columns+0x126>
    85bc: b3 c6 ee 00  	xor	a3, t4, a4
    85c0: 46 93        	add	t1, t1, a7
    85c2: 35 8e        	xor	a2, a2, a3
    85c4: 0d 47        	li	a4, 0x3
    85c6: 23 00 c3 00  	sb	a2, 0x0(t1)
    85ca: 21 46        	li	a2, 0x8
    85cc: 93 16 f9 01  	slli	a3, s2, 0x1f
    85d0: 93 17 87 01  	slli	a5, a4, 0x18
    85d4: fd 86        	srai	a3, a3, 0x1f
    85d6: f9 8e        	and	a3, a3, a4
    85d8: 06 07        	slli	a4, a4, 0x1
    85da: 62 09        	slli	s2, s2, 0x18
    85dc: 7d 16        	addi	a2, a2, -0x1
    85de: fd 87        	srai	a5, a5, 0x1f
    85e0: ed 8b        	andi	a5, a5, 0x1b
    85e2: b5 8d        	xor	a1, a1, a3
    85e4: 3d 8f        	xor	a4, a4, a5
    85e6: 13 59 99 01  	srli	s2, s2, 0x19
    85ea: 6d f2        	bnez	a2, 0x85cc <mix_columns+0x154>
    85ec: 89 47        	li	a5, 0x2
    85ee: 21 47        	li	a4, 0x8
    85f0: 93 96 f9 01  	slli	a3, s3, 0x1f
    85f4: 93 94 87 01  	slli	s1, a5, 0x18
    85f8: fd 86        	srai	a3, a3, 0x1f
    85fa: fd 8e        	and	a3, a3, a5
    85fc: 86 07        	slli	a5, a5, 0x1
    85fe: e2 09        	slli	s3, s3, 0x18
    8600: 7d 17        	addi	a4, a4, -0x1
    8602: fd 84        	srai	s1, s1, 0x1f
    8604: ed 88        	andi	s1, s1, 0x1b
    8606: 35 8e        	xor	a2, a2, a3
    8608: a5 8f        	xor	a5, a5, s1
    860a: 93 d9 99 01  	srli	s3, s3, 0x19
    860e: 6d f3        	bnez	a4, 0x85f0 <mix_columns+0x178>
    8610: b3 46 7e 00  	xor	a3, t3, t2
    8614: c6 92        	add	t0, t0, a7
    8616: b5 8d        	xor	a1, a1, a3
    8618: b1 8d        	xor	a1, a1, a2
    861a: 05 0f        	addi	t5, t5, 0x1
    861c: 23 80 b2 00  	sb	a1, 0x0(t0)
    8620: e3 16 0f e7  	bne	t5, a6, 0x848c <mix_columns+0x14>
    8624: 6c 00        	addi	a1, sp, 0xc
    8626: 41 46        	li	a2, 0x10
    8628: 75 39        	jal	0x82e4 <memcpy>
    862a: b2 50        	lw	ra, 0x2c(sp)
    862c: 22 54        	lw	s0, 0x28(sp)
    862e: 92 54        	lw	s1, 0x24(sp)
    8630: 02 59        	lw	s2, 0x20(sp)
    8632: f2 49        	lw	s3, 0x1c(sp)
    8634: 45 61        	addi	sp, sp, 0x30
    8636: 82 80        	ret

Disassembly of section .text.add_round_key:

00008638 <add_round_key>:
    8638: 13 06 05 01  	addi	a2, a0, 0x10
    863c: 83 c6 05 00  	lbu	a3, 0x0(a1)
    8640: 03 47 05 00  	lbu	a4, 0x0(a0)
    8644: b9 8e        	xor	a3, a3, a4
    8646: 23 00 d5 00  	sb	a3, 0x0(a0)
    864a: 05 05        	addi	a0, a0, 0x1
    864c: 85 05        	addi	a1, a1, 0x1
    864e: e3 17 c5 fe  	bne	a0, a2, 0x863c <add_round_key+0x4>
    8652: 82 80        	ret

Disassembly of section .text.aes128_encrypt_block:

00008654 <aes128_encrypt_block>:
    8654: 41 11        	addi	sp, sp, -0x10
    8656: 32 88        	mv	a6, a2
    8658: 83 48 c5 00  	lbu	a7, 0xc(a0)
    865c: 83 42 d5 00  	lbu	t0, 0xd(a0)
    8660: 03 47 e5 00  	lbu	a4, 0xe(a0)
    8664: 83 47 f5 00  	lbu	a5, 0xf(a0)
    8668: 03 46 85 00  	lbu	a2, 0x8(a0)
    866c: 83 46 95 00  	lbu	a3, 0x9(a0)
    8670: 03 43 a5 00  	lbu	t1, 0xa(a0)
    8674: 83 43 b5 00  	lbu	t2, 0xb(a0)
    8678: a2 02        	slli	t0, t0, 0x8
    867a: 42 07        	slli	a4, a4, 0x10
    867c: e2 07        	slli	a5, a5, 0x18
    867e: a2 06        	slli	a3, a3, 0x8
    8680: b3 e8 12 01  	or	a7, t0, a7
    8684: 33 ee e7 00  	or	t3, a5, a4
    8688: b3 e2 c6 00  	or	t0, a3, a2
    868c: 83 46 45 00  	lbu	a3, 0x4(a0)
    8690: 83 47 55 00  	lbu	a5, 0x5(a0)
    8694: 03 46 65 00  	lbu	a2, 0x6(a0)
    8698: 03 47 75 00  	lbu	a4, 0x7(a0)
    869c: 42 03        	slli	t1, t1, 0x10
    869e: e2 03        	slli	t2, t2, 0x18
    86a0: a2 07        	slli	a5, a5, 0x8
    86a2: 42 06        	slli	a2, a2, 0x10
    86a4: 62 07        	slli	a4, a4, 0x18
    86a6: 33 e3 63 00  	or	t1, t2, t1
    86aa: b3 e3 d7 00  	or	t2, a5, a3
    86ae: 83 47 05 00  	lbu	a5, 0x0(a0)
    86b2: 83 46 15 00  	lbu	a3, 0x1(a0)
    86b6: 59 8e        	or	a2, a2, a4
    86b8: 03 47 25 00  	lbu	a4, 0x2(a0)
    86bc: 03 45 35 00  	lbu	a0, 0x3(a0)
    86c0: a2 06        	slli	a3, a3, 0x8
    86c2: dd 8e        	or	a3, a3, a5
    86c4: 42 07        	slli	a4, a4, 0x10
    86c6: 62 05        	slli	a0, a0, 0x18
    86c8: 59 8d        	or	a0, a0, a4
    86ca: 33 67 1e 01  	or	a4, t3, a7
    86ce: b3 67 53 00  	or	a5, t1, t0
    86d2: 33 66 76 00  	or	a2, a2, t2
    86d6: c9 8e        	or	a3, a3, a0
    86d8: 0a 85        	mv	a0, sp
    86da: 36 c0        	sw	a3, 0x0(sp)
    86dc: 32 c2        	sw	a2, 0x4(sp)
    86de: 3e c4        	sw	a5, 0x8(sp)
    86e0: 3a c6        	sw	a4, 0xc(sp)
    86e2: 10 08        	addi	a2, sp, 0x10
    86e4: ae 86        	mv	a3, a1
    86e6: 03 c7 06 00  	lbu	a4, 0x0(a3)
    86ea: 83 47 05 00  	lbu	a5, 0x0(a0)
    86ee: 3d 8f        	xor	a4, a4, a5
    86f0: 23 00 e5 00  	sb	a4, 0x0(a0)
    86f4: 05 05        	addi	a0, a0, 0x1
    86f6: 85 06        	addi	a3, a3, 0x1
    86f8: e3 17 c5 fe  	bne	a0, a2, 0x86e6 <aes128_encrypt_block+0x92>
    86fc: 02 43        	lw	t1, 0x0(sp)
    86fe: 13 86 c5 01  	addi	a2, a1, 0x1c
    8702: 93 88 c5 0a  	addi	a7, a1, 0xac
    8706: 83 27 46 ff  	lw	a5, -0xc(a2)
    870a: b3 87 67 26  	aes32esmi	a5, a5, t1, 0x0
    870e: 92 42        	lw	t0, 0x4(sp)
    8710: 23 2a f6 fe  	sw	a5, -0xc(a2)
    8714: b3 87 57 66  	aes32esmi	a5, a5, t0, 0x1
    8718: a2 43        	lw	t2, 0x8(sp)
    871a: 23 2a f6 fe  	sw	a5, -0xc(a2)
    871e: b3 87 77 a6  	aes32esmi	a5, a5, t2, 0x2
    8722: 32 45        	lw	a0, 0xc(sp)
    8724: 23 2a f6 fe  	sw	a5, -0xc(a2)
    8728: b3 87 a7 e6  	aes32esmi	a5, a5, a0, 0x3
    872c: 83 26 86 ff  	lw	a3, -0x8(a2)
    8730: 23 2a f6 fe  	sw	a5, -0xc(a2)
    8734: b3 86 56 26  	aes32esmi	a3, a3, t0, 0x0
    8738: 23 2c d6 fe  	sw	a3, -0x8(a2)
    873c: b3 86 76 66  	aes32esmi	a3, a3, t2, 0x1
    8740: 23 2c d6 fe  	sw	a3, -0x8(a2)
    8744: b3 86 a6 a6  	aes32esmi	a3, a3, a0, 0x2
    8748: 23 2c d6 fe  	sw	a3, -0x8(a2)
    874c: b3 86 66 e6  	aes32esmi	a3, a3, t1, 0x3
    8750: 03 27 c6 ff  	lw	a4, -0x4(a2)
    8754: 23 2c d6 fe  	sw	a3, -0x8(a2)
    8758: 33 07 77 26  	aes32esmi	a4, a4, t2, 0x0
    875c: 23 2e e6 fe  	sw	a4, -0x4(a2)
    8760: 33 07 a7 66  	aes32esmi	a4, a4, a0, 0x1
    8764: 23 2e e6 fe  	sw	a4, -0x4(a2)
    8768: 33 07 67 a6  	aes32esmi	a4, a4, t1, 0x2
    876c: 23 2e e6 fe  	sw	a4, -0x4(a2)
    8770: 33 07 57 e6  	aes32esmi	a4, a4, t0, 0x3
    8774: 1c 42        	lw	a5, 0x0(a2)
    8776: 23 2e e6 fe  	sw	a4, -0x4(a2)
    877a: b3 87 a7 26  	aes32esmi	a5, a5, a0, 0x0
    877e: 1c c2        	sw	a5, 0x0(a2)
    8780: b3 87 67 66  	aes32esmi	a5, a5, t1, 0x1
    8784: 1c c2        	sw	a5, 0x0(a2)
    8786: b3 87 57 a6  	aes32esmi	a5, a5, t0, 0x2
    878a: 1c c2        	sw	a5, 0x0(a2)
    878c: b3 87 77 e6  	aes32esmi	a5, a5, t2, 0x3
    8790: 03 23 46 ff  	lw	t1, -0xc(a2)
    8794: 03 27 86 ff  	lw	a4, -0x8(a2)
    8798: 83 26 c6 ff  	lw	a3, -0x4(a2)
    879c: 1c c2        	sw	a5, 0x0(a2)
    879e: 41 06        	addi	a2, a2, 0x10
    87a0: 3a c2        	sw	a4, 0x4(sp)
    87a2: 36 c4        	sw	a3, 0x8(sp)
    87a4: 3e c6        	sw	a5, 0xc(sp)
    87a6: e3 10 16 f7  	bne	a2, a7, 0x8706 <aes128_encrypt_block+0xb2>
    87aa: 83 a8 05 0a  	lw	a7, 0xa0(a1)
    87ae: b3 88 68 22  	aes32esi	a7, a7, t1, 0x0
    87b2: 23 a0 15 0b  	sw	a7, 0xa0(a1)
    87b6: b3 88 e8 62  	aes32esi	a7, a7, a4, 0x1
    87ba: 23 a0 15 0b  	sw	a7, 0xa0(a1)
    87be: b3 88 d8 a2  	aes32esi	a7, a7, a3, 0x2
    87c2: 23 a0 15 0b  	sw	a7, 0xa0(a1)
    87c6: b3 88 f8 e2  	aes32esi	a7, a7, a5, 0x3
    87ca: 03 a6 45 0a  	lw	a2, 0xa4(a1)
    87ce: 23 a0 15 0b  	sw	a7, 0xa0(a1)
    87d2: 33 06 e6 22  	aes32esi	a2, a2, a4, 0x0
    87d6: 23 a2 c5 0a  	sw	a2, 0xa4(a1)
    87da: 33 06 d6 62  	aes32esi	a2, a2, a3, 0x1
    87de: 23 a2 c5 0a  	sw	a2, 0xa4(a1)
    87e2: 33 06 f6 a2  	aes32esi	a2, a2, a5, 0x2
    87e6: 23 a2 c5 0a  	sw	a2, 0xa4(a1)
    87ea: 33 06 66 e2  	aes32esi	a2, a2, t1, 0x3
    87ee: 83 a8 85 0a  	lw	a7, 0xa8(a1)
    87f2: 23 a2 c5 0a  	sw	a2, 0xa4(a1)
    87f6: b3 88 d8 22  	aes32esi	a7, a7, a3, 0x0
    87fa: 23 a4 15 0b  	sw	a7, 0xa8(a1)
    87fe: b3 88 f8 62  	aes32esi	a7, a7, a5, 0x1
    8802: 23 a4 15 0b  	sw	a7, 0xa8(a1)
    8806: b3 88 68 a2  	aes32esi	a7, a7, t1, 0x2
    880a: 23 a4 15 0b  	sw	a7, 0xa8(a1)
    880e: b3 88 e8 e2  	aes32esi	a7, a7, a4, 0x3
    8812: 83 a2 c5 0a  	lw	t0, 0xac(a1)
    8816: 23 a4 15 0b  	sw	a7, 0xa8(a1)
    881a: 93 88 05 0a  	addi	a7, a1, 0xa0
    881e: b3 82 f2 22  	aes32esi	t0, t0, a5, 0x0
    8822: 23 a6 55 0a  	sw	t0, 0xac(a1)
    8826: b3 82 62 62  	aes32esi	t0, t0, t1, 0x1
    882a: 23 a6 55 0a  	sw	t0, 0xac(a1)
    882e: b3 82 e2 a2  	aes32esi	t0, t0, a4, 0x2
    8832: 23 a6 55 0a  	sw	t0, 0xac(a1)
    8836: b3 82 d2 e2  	aes32esi	t0, t0, a3, 0x3
    883a: 41 46        	li	a2, 0x10
    883c: 23 a6 55 0a  	sw	t0, 0xac(a1)
    8840: 42 85        	mv	a0, a6
    8842: c6 85        	mv	a1, a7
    8844: 41 01        	addi	sp, sp, 0x10
    8846: 79 bc        	j	0x82e4 <memcpy>

Disassembly of section .text.aes128_ecb_encrypt:

00008848 <aes128_ecb_encrypt>:
    8848: 09 71        	addi	sp, sp, -0x180
    884a: 23 2e 11 16  	sw	ra, 0x17c(sp)
    884e: 23 2c 81 16  	sw	s0, 0x178(sp)
    8852: 23 2a 91 16  	sw	s1, 0x174(sp)
    8856: 23 28 21 17  	sw	s2, 0x170(sp)
    885a: 23 26 31 17  	sw	s3, 0x16c(sp)
    885e: ae 84        	mv	s1, a1
    8860: bd 89        	andi	a1, a1, 0xf
    8862: 95 e5        	bnez	a1, 0x888e <aes128_ecb_encrypt+0x46>
    8864: 36 89        	mv	s2, a3
    8866: aa 89        	mv	s3, a0
    8868: 6c 19        	addi	a1, sp, 0xbc
    886a: 32 85        	mv	a0, a2
    886c: 4d 3c        	jal	0x831e <expand_key>
    886e: 85 c0        	beqz	s1, 0x888e <aes128_ecb_encrypt+0x46>
    8870: 01 44        	li	s0, 0x0
    8872: 68 00        	addi	a0, sp, 0xc
    8874: 6c 19        	addi	a1, sp, 0xbc
    8876: 13 06 00 0b  	li	a2, 0xb0
    887a: ad 34        	jal	0x82e4 <memcpy>
    887c: 33 85 89 00  	add	a0, s3, s0
    8880: 33 06 89 00  	add	a2, s2, s0
    8884: 6c 00        	addi	a1, sp, 0xc
    8886: f9 33        	jal	0x8654 <aes128_encrypt_block>
    8888: 41 04        	addi	s0, s0, 0x10
    888a: e3 64 94 fe  	bltu	s0, s1, 0x8872 <aes128_ecb_encrypt+0x2a>
    888e: 83 20 c1 17  	lw	ra, 0x17c(sp)
    8892: 03 24 81 17  	lw	s0, 0x178(sp)
    8896: 83 24 41 17  	lw	s1, 0x174(sp)
    889a: 03 29 01 17  	lw	s2, 0x170(sp)
    889e: 83 29 c1 16  	lw	s3, 0x16c(sp)
    88a2: 19 61        	addi	sp, sp, 0x180
    88a4: 82 80        	ret

Disassembly of section .text.write_to_address:

000088a6 <write_to_address>:
    88a6: 0c c1        	sw	a1, 0x0(a0)
    88a8: 82 80        	ret

Disassembly of section .text.write_v_to_address:

000088aa <write_v_to_address>:
    88aa: 13 06 05 01  	addi	a2, a0, 0x10
    88ae: 94 41        	lw	a3, 0x0(a1)
    88b0: 14 c1        	sw	a3, 0x0(a0)
    88b2: 11 05        	addi	a0, a0, 0x4
    88b4: 91 05        	addi	a1, a1, 0x4
    88b6: e3 1c c5 fe  	bne	a0, a2, 0x88ae <write_v_to_address+0x4>
    88ba: 82 80        	ret

Disassembly of section .text.main:

000088bc <main>:
    88bc: 01 11        	addi	sp, sp, -0x20
    88be: 06 ce        	sw	ra, 0x1c(sp)
    88c0: 22 cc        	sw	s0, 0x18(sp)
    88c2: 26 ca        	sw	s1, 0x14(sp)
    88c4: 4a c8        	sw	s2, 0x10(sp)
    88c6: 37 29 10 00  	lui	s2, 0x102
    88ca: 37 05 10 00  	lui	a0, 0x100
    88ce: 13 05 a5 12  	addi	a0, a0, 0x12a
    88d2: 37 06 10 00  	lui	a2, 0x100
    88d6: 13 06 a6 10  	addi	a2, a2, 0x10a
    88da: c1 44        	li	s1, 0x10
    88dc: c1 45        	li	a1, 0x10
    88de: 8a 86        	mv	a3, sp
    88e0: 0a 84        	mv	s0, sp
    88e2: 9d 37        	jal	0x8848 <aes128_ecb_encrypt>
    88e4: 37 15 a5 fb  	lui	a0, 0xfba51
    88e8: b7 f5 4b 71  	lui	a1, 0x714bf
    88ec: 37 b6 25 2e  	lui	a2, 0x2e25b
    88f0: 13 05 45 91  	addi	a0, a0, -0x6ec
    88f4: 23 28 a9 02  	sw	a0, 0x30(s2)
    88f8: 37 15 f9 aa  	lui	a0, 0xaaf91
    88fc: 93 85 f5 41  	addi	a1, a1, 0x41f
    8900: 13 06 e6 ab  	addi	a2, a2, -0x542
    8904: 13 05 f5 80  	addi	a0, a0, -0x7f1
    8908: 23 2a b9 02  	sw	a1, 0x34(s2)
    890c: 23 2c c9 02  	sw	a2, 0x38(s2)
    8910: 23 2e a9 02  	sw	a0, 0x3c(s2)
    8914: 02 45        	lw	a0, 0x0(sp)
    8916: 23 20 a9 04  	sw	a0, 0x40(s2)
    891a: 12 45        	lw	a0, 0x4(sp)
    891c: 23 22 a9 04  	sw	a0, 0x44(s2)
    8920: 22 45        	lw	a0, 0x8(sp)
    8922: 23 24 a9 04  	sw	a0, 0x48(s2)
    8926: 32 45        	lw	a0, 0xc(sp)
    8928: b7 25 c8 a8  	lui	a1, 0xa8c82
    892c: 37 06 ff 17  	lui	a2, 0x17ff0
    8930: 23 26 a9 04  	sw	a0, 0x4c(s2)
    8934: 37 05 10 00  	lui	a0, 0x100
    8938: 13 05 a5 11  	addi	a0, a0, 0x11a
    893c: 93 85 f5 b9  	addi	a1, a1, -0x461
    8940: 13 06 06 aa  	addi	a2, a2, -0x560
    8944: 33 06 b6 66  	aes32esmi	a2, a2, a1, 0x1
    8948: b7 b5 aa ba  	lui	a1, 0xbaaab
    894c: 23 28 c9 04  	sw	a2, 0x50(s2)
    8950: 37 c6 fe ca  	lui	a2, 0xcafec
    8954: 93 85 d5 aa  	addi	a1, a1, -0x553
    8958: 23 2a a9 04  	sw	a0, 0x54(s2)
    895c: 23 2c a9 04  	sw	a0, 0x58(s2)
    8960: 23 2e a9 04  	sw	a0, 0x5c(s2)
    8964: 13 06 e6 ab  	addi	a2, a2, -0x542
    8968: 83 46 04 00  	lbu	a3, 0x0(s0)
    896c: 03 47 05 00  	lbu	a4, 0x0(a0)
    8970: 63 97 e6 00  	bne	a3, a4, 0x897e <main+0xc2>
    8974: fd 14        	addi	s1, s1, -0x1
    8976: 05 05        	addi	a0, a0, 0x1
    8978: 05 04        	addi	s0, s0, 0x1
    897a: fd f4        	bnez	s1, 0x8968 <main+0xac>
    897c: b2 85        	mv	a1, a2
    897e: 23 22 b9 00  	sw	a1, 0x4(s2)
    8982: 37 c5 ad de  	lui	a0, 0xdeadc
    8986: 13 05 f5 ee  	addi	a0, a0, -0x111
    898a: b7 25 10 00  	lui	a1, 0x102
    898e: 88 c1        	sw	a0, 0x0(a1)
    8990: 01 45        	li	a0, 0x0
    8992: f2 40        	lw	ra, 0x1c(sp)
    8994: 62 44        	lw	s0, 0x18(sp)
    8996: d2 44        	lw	s1, 0x14(sp)
    8998: 42 49        	lw	s2, 0x10(sp)
    899a: 05 61        	addi	sp, sp, 0x20
    899c: 82 80        	ret
