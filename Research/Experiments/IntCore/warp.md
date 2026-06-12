# GPU Thread Warp Experiment

## Objective

Create a functional thread warp that runs multiple lanes (target: 8) in parallel and integrates with the existing lane modules to exercise SIMD-style execution across threads.

## Hypothesis

A simple warp scheduler (round-robin or token-based) coordinating 8 lanes will enable correct, deterministic parallel execution with minimal scheduler logic and acceptable timing/resource overhead.

## Method

- **Setup:**
	- RTL: `HDL/int_core/` (warp and lane modules)
	- Testbenches: `HDL/int_core/tb/`
	- Simulation: existing waveform/sim scripts in `Research/Experiments/IntCore/scripts/`

- **Procedure:**
	1. Design `warp` module to accept `N` lanes (initial N=8).
	2. Implement a simple scheduler (round-robin / warp mask) that issues the same instruction to all active lanes.
	3. Connect lanes to the warp and create a top-level testbench with stimulus for typical instruction flows.
	4. Run cycle-accurate simulations, capture waveforms and counters.
	5. Iterate on scheduler to fix hazards and control flow divergence.

- **Metrics:**
	- Throughput: instructions retired per cycle (IPC)
	- Latency: cycles per instruction for warp-wide ops
	- Correctness: functional pass/fail across representative instruction set
	- Resource usage: LUTs/FFs (FPGA) and critical path timing

## Progress

- 6/11/26: Made a simple warp that can run 8 lanes in parallel
  - TODOs: Implement a simple scheduler

## Results

- **Summary:**
	- I made a functional warp that can run 8 simple lanes at once

- **Raw data:**
	- Simulation waveforms, logs, and counter dumps saved to `FPGA Protoype/results/int_core/` (or local `results/` subfolder).

## Analysis

Initial tests show the scheduler can broadcast to 8 lanes and synchronize simple ALU operations. Next focus: handling divergent control flow and memory accesses.

## Status

- [ ] Planned  - [x] In progress  - [ ] Complete

## Attachments / Files

- RTL: HDL/int_core/
- Testbenches: HDL/int_core/tb/
- Scripts: Research/Experiments/IntCore/scripts/
- Raw outputs: FPGA Protoype/results/int_core/
