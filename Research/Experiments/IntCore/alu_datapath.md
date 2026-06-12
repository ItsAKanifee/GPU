# Single-Lane / Single-Thread Datapath (GPU Lane Experiment)

## Objective
Define and experiment with a compact, synthesizable datapath representing a single GPU lane (one thread in a SIMD lane). Focus on integer ALU functionality, per-lane register state, predicate/mask handling, and a simplified L1-like memory interface.

## Hypothesis
A minimal lane datapath (16x32 register file, combinational ALU, simple LSU) with a 1–3 stage pipeline will be sufficient to validate functional correctness and provide meaningful synthesis estimates (area and fmax) while remaining easy to integrate into a warp scheduler.

## Method
- **Setup:**
  - RTL location: `HDL/int_core/` (create `lane_datapath.sv`, `lane_alu.sv`, `lane_rf.sv`, `lane_lsu.sv`)
  - Testbenches: `HDL/int_core/tb/` (`lane_tb.sv`, `l1_model.sv`)
  - Scripts: `Research/Experiments/IntCore/scripts/` for simulation, waveform capture, and golden-model comparison
- **Procedure:**
  1. Define a compact instruction encoding and the `lane_rf` (configurable register count and widths).
  2. Implement `lane_alu` (combinational baseline) and wire into `lane_datapath` skeleton.
  3. Add optional pipeline registers (baseline: Fetch/Decode -> Execute -> Writeback).
  4. Implement a basic `lane_lsu` and a synchronous L1 testbench model with configurable latency.
  5. Create a golden-model checker (Python/C) and a set of functional tests (random vectors and microbenchmarks).
  6. Run simulations, collect waveforms, correctness logs, and cycle counts; iterate on hazard handling (scoreboard/bypass) as needed.
- **Metrics:**
  - Correctness: number of mismatches vs golden model
  - Performance: cycles per kernel, IPC (assumed ideal scheduler)
  - Synthesis: LUT/FF/BRAM usage and post-synthesis fmax
  - Implementation complexity: lines of RTL and testbench

## Progress

- 6/11/26: Created a simple lane that can accept two 32 bit integers and opcode and perform on operation
  - TODOs: Have the lane read from a register file

## Results

- **Summary:**
	- Created a simple lane that can take a segment of a vector and compute

- **Raw data:**
  - Place simulation outputs, waveform captures, and logs in `FPGA Protoype/results/int_core/lane/`.

## Analysis
The single-lane experiment isolates functional and timing characteristics of ALU and LSU implementations without warp-level complexity. This makes it easier to evaluate pipeline depth trade-offs, forwarding logic, and memory-latency tolerance prior to integrating into the warp scheduler.

## Status
- [ ] Planned  - [x] In progress  - [ ] Complete

## Attachments / Files
- RTL: HDL/int_core/ (lane modules)
- Testbenches: HDL/int_core/tb/
- Scripts: Research/Experiments/IntCore/scripts/
- Raw outputs: FPGA Protoype/results/int_core/lane/

## Next Steps
- Implement `lane_datapath.sv` skeleton and `lane_alu.sv`, run a small functional test (100 vectors), and report mismatches and resource estimates.
