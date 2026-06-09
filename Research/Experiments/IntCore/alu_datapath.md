# ALU Data Path

## Objective
Create a functional integer-core datapath that implements ALU operations, memory operands, and a minimal instruction flow. The datapath should execute the operation A*B+C where A, B and C are read from memory and the result is written back.

## Hypothesis
A modestly pipelined ALU datapath (carry-lookahead for add/multiply partitioning where useful) will meet the target frequency while keeping area low enough for integration with other core lanes.

## Method
- **Setup:**
	- RTL: place new modules under `HDL/` (e.g., `int_core/alu.sv`, `int_core/datapath.sv`).
	- Simulator: Questa/ModelSim or iverilog + VCD waveform viewer.
	- Reference: Python (numpy) or C golden model for functional verification.
	- Synthesis: Vivado (target FPGA as defined in project, e.g., Spartan-7).
- **Procedure:**
	1. Implement baseline datapath with a ripple-carry adder and a simple combinational multiplier.
	2. Add register stages for operand fetch, ALU, and writeback to create a 3-stage pipeline.
	3. Replace ripple-carry adders with carry-lookahead variants and compare timing/area.
	4. Add a bypass/forwarding network to avoid stalls for dependent instructions.
	5. Create a SystemVerilog testbench that:
		 - Instantiates the datapath and a small memory model.
		 - Loads a test program that computes A*B+C for random vectors.
		 - Compares RTL outputs to the reference model on every cycle/result.
	6. Run functional simulation with 100k random vectors, record mismatches.
	7. Synthesize the design and capture post-synthesis timing and utilization reports.
- **Metrics:**
	- Correctness: mismatches vs. reference (count and examples).
	- Performance: maximum frequency (fmax), cycle latency for A*B+C.
	- Area: LUTs, FFs, BRAMs used.
	- Pipeline efficiency: stalls per 1k instructions.

## Results
- **Summary:** (fill in after experiments) — include a short table of key metrics.
- **Raw data:** link simulation VCDs, waveform screenshots, synthesis reports, and test vectors.

## Analysis
- Did the datapath meet the hypothesis (timing/area targets)?
- Which adder/multiplier variant provided the best tradeoff?
- Impact of forwarding network on stalls and throughput.
- Recommended next steps (wider datapath, more lanes, power optimization).

## Status
- [ ] Planned  - [ ] In progress  - [ ] Complete

## Attachments / Files
- Suggested file locations:
	- RTL: `HDL/int_core/`
	- Testbenches: `HDL/int_core/tb/`
	- Scripts: `Research/Experiments/IntCore/scripts/`
	- Raw outputs: `FPGA Protoype/results/int_core/`

## Notes
- Keep experiment writeups concise and link to raw logs rather than embedding large files.
- When ready, add a short summary line to `Research/Experiments/README.md` index under `Integer Core`.
