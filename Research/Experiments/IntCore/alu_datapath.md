# Single-Lane / Single-Thread Datapath (GPU Lane Experiment)

## Objective
Define and experiment with a compact datapath representing a single GPU lane (one thread in a SIMD lane). Focus on the minimal hardware needed to execute integer ALU instructions, local register state, predicate/mask handling, and a simplified memory interface representative of an L1 per-slice.

## Background & Scope
This document targets a single-lane datapath as a building block for a wider GPU. The lane executes one thread's instructions in lock-step with other lanes; it must support:
- per-lane register file (small, fast)
- integer ALU (add, sub, mul, logical, shifts)
- predicate/mask handling for lane enable/disable
- a simple memory request/response interface (coalescing handled at higher level)
- minimal control to support predication and simple branch/warp divergence handling

The goal is a small, synthesizable SystemVerilog model suitable for functional simulation and early synthesis to evaluate area/fmax tradeoffs.

## Goals for the Experiment
- Implement a lane datapath that can execute a small instruction set (register-register, register-immediate, load/store, predicate ops).
- Measure correctness against a golden model and capture cycle counts for representative kernels.
- Evaluate pipeline depth (0–3 stages) and simple forwarding to avoid stalls.
- Validate memory request behavior with a simple L1 model and concurrency from other lane stubs.

## Datapath Overview
High-level blocks (per lane):
- `Lane Register File`: 16 x 32-bit (configurable) registers, two read ports, one write port.
- `Instruction Decoder`: decodes a compact instruction format into control signals.
- `ALU`: supports integer add, sub, mul (combinational or pipelined), logical ops, and shifts.
- `Predicate / Mask Unit`: per-lane predicate register and lane-active mask input.
- `Load/Store Unit (LSU)`: issues memory requests, supports simple loads/stores with byte/word granularity.
- `Pipeline Registers`: optional stages between Fetch/Decode, Execute, and Writeback.

Typical datapath flow:
1. Fetch instruction (from an instruction stream provided by testbench).
2. Decode and read operands from `Lane Register File`.
3. Execute in `ALU` or issue memory request from `LSU`.
4. Write results back to register file or signal completion to testbench.

## Instruction Set (minimal)
- `ADD rd, rs1, rs2` — integer add
- `MUL rd, rs1, rs2` — integer multiply
- `LD rd, [rs1+imm]` — load word
- `ST rs2, [rs1+imm]` — store word
- `PSET p, rs1` — set predicate from register
- `BRP offset` — branch if predicate true (handled by testbench warp scheduler)

Instruction encoding should be compact and easy to decode in the `Instruction Decoder` module used in the experiment.

## Pipeline Options
- Latency-0 (combinational ALU): simplest, lowest resource cost, may limit fmax.
- 1–3 stage pipeline: `Fetch/Decode` -> `Execute` -> `Writeback` is recommended as a baseline.
- Optional pipelined multiplier: consider if throughput matters; otherwise use combinational for simplicity.

Hazard handling:
- Simple register scoreboard and bypass paths between Execute and Writeback.
- Stalls inserted by the testbench/scheduler if a load-use hazard occurs.

## Memory Model for Experiments
- Implement a small synchronous L1-Like memory model in the testbench that accepts requests and returns responses after configurable latency.
- LSU issues requests with a tag; responses match tag.
- For single-lane experiments, coalescing is not required — keep the LUT/FF count small.

## Testbench & Verification
- Create a SystemVerilog testbench under `HDL/int_core/tb/` that:
  - Provides an instruction stream representing small kernels (e.g., A*B+C per element, simple reduction fragments).
  - Drives per-lane active mask and predicate inputs.
  - Provides an L1 memory model with configurable latency.
  - Compares outputs to a golden model implemented in Python (numpy) or C.
- Tests to run:
  - Functional correctness for 10k random vectors.
  - Microbenchmarks: sequences with dependent ALU ops, memory loads, and predicate-based masking.

## Metrics
- Correctness: zero mismatches vs golden model (or list mismatches).
- Performance: cycles per kernel, instructions per cycle (IPC) assuming ideal scheduling.
- Synthesis: LUTs/FFs/BRAMs for the lane datapath and fmax from post-synthesis timing.

## Files / Locations
- RTL: `HDL/int_core/` (add `lane_datapath.sv`, `lane_alu.sv`, `lane_rf.sv`, `lane_lsu.sv`)
- Testbenches: `HDL/int_core/tb/` (add `lane_tb.sv`, `l1_model.sv`)
- Scripts: `Research/Experiments/IntCore/scripts/` for simulation and comparison harnesses

## Quick Implementation Plan
1. Define instruction encoding and `lane_rf` API.
2. Implement `lane_alu` (combinational) and connect to `lane_datapath` skeleton.
3. Build `lane_lsu` and simple `l1_model` in testbench.
4. Create golden-model checker and run functional tests.

## Status
- [ ] Planned  - [x] In progress  - [ ] Complete

## Next Steps
- Implement `lane_datapath.sv` skeleton and a tight testbench. Run a small functional test (100 vectors) and report mismatches and resource estimates.

## Notes
- Keep the lane simple; integration (warp scheduler, inter-lane coalescing) will be separate experiments.
- Track all results in `FPGA Protoype/results/int_core/lane/`.
