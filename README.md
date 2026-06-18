# riscy-aes

A hardware AES-128 accelerator for the CV32E40P RISC-V core, built for the CESE4040 Processor Design Project at TU Delft. The accelerator adds custom instructions that move the entire AES round structure into the core's execute stage, taking encryption from ~59,560 software cycles down to 200 cycles, and decryption from ~103,995 cycles down to 210, while keeping all post-route timing constraints met.

## Why

AES on a general-purpose RISC-V core spends almost all of its time on `SubBytes` and `MixColumns`, which are easy to parallelize in hardware but expensive to do byte-by-byte in software. With Dennard scaling no longer delivering free frequency gains, the only way to get meaningfully faster is to exploit that parallelism directly: pull the data in once, run all 10 AES rounds without going back through the instruction pipeline, and stall the core for exactly as long as the hardware needs and no longer.

The project frames this as two competing goals relevant to latency-sensitive systems (e.g. encrypted market data in HFT-style pipelines): minimizing clock cycles per block (low latency) versus maximizing blocks processed per second (high throughput). The custom-instruction design here optimizes primarily for the former.

## Architecture

The accelerator sits alongside the CV32E40P's existing execute-stage units (ALU, MULT/DOTP, FPU) and reuses the core's load-store unit rather than adding a separate memory port. The state and key live in a small dedicated AES register file ("shadow registers") rather than the main GPRs, so a 128-bit AES state and 128-bit key can be held and operated on as a unit instead of juggled across four 32-bit registers. (CV32E40P itself is not part of this project's contribution — see [Authors](#authors) below for its origin and license.)

```
CV32E40P core
 ├─ IF/ID/EX/WB pipeline (unmodified)
 ├─ ALU / MULT-DOTP / FPU (existing)
 └─ AES unit (new)
      ├─ AES_mem: 128b state + 128b key shadow registers
      └─ AES core: FSM-driven round datapath
```

### Custom instructions

| Instruction | Effect |
|---|---|
| `aes32load(sr_index, base, offset)` | Loads 4 bytes via the standard LSU, redirects writeback into the AES shadow register file instead of the GPRs |
| `aes32store(sr_index, base, offset)` | Stores 4 bytes via the standard LSU, reading from the AES shadow register file |
| `aes32encrypt` | Runs all 10 AES rounds on the 16-byte state in one instruction, driven by an internal FSM |
| `aes32decrypt` | Same, in reverse, including in-flight key expansion (round keys are not precomputed) |

A full block operation is 8 loads (state + key) + `aes32encrypt`/`aes32decrypt` + 4 stores. Loads and stores pipeline normally; the encrypt/decrypt instruction stalls the pipeline for the FSM's duration, then resumes.

### Control FSM

Encryption: `IDLE → BEFORE_START → START → STAGE_ONE ⇄ STAGE_TWO (×10 rounds) → FLUSH → FLUSH_DONE → IDLE`

Decryption follows the same shape but adds a `KEY_EXPAND` state before the round loop, since decryption needs round keys computed in the forward direction before consuming them in reverse.

### Related work

The design follows the general shape of [AES-RV](https://arxiv.org/abs/2505.11880) (Nguyen et al., 2025), a hardware-efficient RISC-V AES instruction extension for IoT security, adapted here for the CV32E40P with a from-scratch shadow-register and FSM implementation rather than reusing their core modifications.

## Results

### Latency

Cycles to process one AES-128 block (encryption / decryption), software baseline through the final hardware design:

| Implementation | Encryption (cyc) | Decryption (cyc) |
|---|---|---|
| Software AES (C, on CV32E40P) | 59,560 | 103,995 |
| AES32 extension (load/store only, no fused round instr.) | 7,138 | 101,024 |
| Custom AES (this design) | 200 | 210 |
| Custom AES (fast clock variant) | 200 | 210 |

That's roughly a 298x speedup on encryption and 495x on decryption over the software baseline, against a theoretical memory-bound ceiling of about 3,971x (limited by 8 loads + 4 stores at one word per instruction, pipelined).

### Resource utilization

| Implementation | LUTs | FFs | BRAMs | DSPs | F (MHz) |
|---|---|---|---|---|---|
| Software AES (C) | 9,227 | 7,957 | 16 | 5 | 20 |
| AES32 extension | 9,743 | 8,027 | 16 | 5 | 20 |
| Custom AES | 12,623 | 8,519 | 16 | 5 | 20 |
| Custom AES (fast) | 12,621 | 8,519 | 16 | 5 | 60 |

Merging the encrypt and decrypt datapaths into a single shared unit rather than keeping them separate saved 202 LUTs (6.2%) and 270 flip-flops (48.1%) versus two standalone modules.

### Timing (post-route, 50 MHz / 20 ns constraint)

All constraints met. Worst negative slack (setup) across the full design: +1.580 ns. Worst hold slack: +0.162 ns. The merged AES unit itself has +5.386 ns of setup slack at a 14.594 ns data path, comfortably inside the 20 ns budget.

## Optimizations

**LLVM loop unrolling.** The middle-round loop in the software AES path issues one `aes32esmi`/`aes32dsmi` inline-asm instruction per byte per round. A custom LLVM pass detects loops containing these instructions and force-unrolls them (`UnrollLoopOptions.Count = 9`, `Force = true`), removing per-iteration branch overhead. This took the instruction count for the relevant loop from 16 inline-asm call sites to 144 in the generated IR.

**Asynchronous dual-clock AES engine (future-work prototype).** A second iteration decouples the AES round datapath onto its own 185 MHz clock domain, separate from the CV32E40P core's 64.5 MHz domain (a 2.87x ratio), so the AES engine isn't bottlenecked by the core's own timing closure. Crossing is handled with single-bit toggle signals (req/ack/done) edge-detected after 2–3 `ASYNC_REG` synchronizer flops, with the 128-bit state/key payload held stable in registers while only the toggle bits cross domains — avoiding the need for a synchronous FIFO. Post-route, the critical path sits inside the AES engine itself at +0.009 ns slack (185 MHz being the deliberate bottleneck), while the core domain has +0.413 ns and the CDC crossing itself carries a comfortable 8 ns of slack via `set_max_delay`. This brings inner-engine latency to 12 AES-domain cycles per block (14 cycles as seen from the core side). It was evaluated as a design exploration rather than merged into the primary submission.

A related question explored was BRAM-backed vs. distributed-LUT S-box mapping. BRAM was rejected for three reasons: it has no asynchronous read port (would force an extra pipeline stage), AES needs 20 S-box lookups per round against typically 2 ports per BRAM (requiring duplicated blocks), and the existing LUT-based ROM already sits on a path that's 72% routed, so introducing BRAM placement risked lengthening it. The cost of staying LUT-based is +506 LUTs (+54%) versus allowing BRAM, which was judged acceptable given the full design lands at 22% LUT and 11% BRAM utilization on the PYNQ-Z2.

## Future work

- Wider load/store instructions (16 bytes per instruction instead of 4) to cut the load/store overhead that currently dominates the non-round portion of a block's latency.
- Multiple AES engines running in parallel, scaling throughput with the number of copies, plus block pipelining or DMA streaming to keep them fed.
- Parallel block-cipher modes (CTR, GCM) for real-world chaining and embarrassingly parallel workloads.
- Caching expanded round keys across multiple blocks under the same key, instead of re-expanding per block.
- Side-channel hardening (masking) and support for AES-192/256 key sizes.

## Repository layout

```
hardware/    SystemVerilog RTL, testbenches, Vivado project/build scripts
software/    AES reference C implementation, build config
table_gen/   LLVM/compiler-side generation for the custom instruction encodings
images/      Diagrams and figures used in documentation
```

## Building and running

This project targets a PYNQ-Z2 board via Vivado. At a high level:

1. Open Vivado and source the project creation script from the `hardware/` directory to build the base project.
2. Run simulation to verify correctness of the AES instructions against known-good vectors.
3. Run out-of-context (OOC) synthesis on the AES unit to check timing and utilization in isolation before committing to a full build.
4. Generate the bitstream and load it onto the PYNQ-Z2, then drive the core via the board's Jupyter Notebook interface over its processing system.

See the scripts under `hardware/scripts` for the individual Tcl entry points (project creation, simulation, OOC synthesis, full synthesis/implementation).

## Authors

**This project (AES accelerator, custom instructions, FSM, async dual-clock extension):**
Borislav Semerdzhiev, Daniel Stefanov, Isidora Jovanović, Nazar Vasyliev — Group 29, CESE4040 Processor Design Project, TU Delft.

**Base CPU core (CV32E40P), not authored by this project:**
This work extends the CV32E40P RISC-V core, maintained by the [OpenHW Group](https://www.openhwgroup.org) since February 2020. CV32E40P originated as RI5CY, developed by the PULP (Parallel Ultra Low Power) Platform team at ETH Zürich's Integrated Systems Laboratory and the University of Bologna's Energy-efficient Embedded Systems group. CV32E40P is distributed under the Solderpad Hardware License v0.51; see the [openhwgroup/cv32e40p](https://github.com/openhwgroup/cv32e40p) repository for the original source and license terms. None of the core pipeline, register file, or ALU/MULT/FPU logic in this repository's `cv32e40p`-derived files was written by this project's authors — only the AES unit and its integration points are original to this work.
