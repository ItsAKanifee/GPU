# Floating Point Core Experiments

Purpose

- Prototype and validate floating-point datapath components (32-bit adder, multiplier), pipelining strategies, and integration with the GPU datapath.

Hypothesis

- A pipelined design separating exponent and mantissa handling will meet timing while keeping area within target bounds for our FPGA platform.

Directory structure (per experiment)

- `README.md` — this file (overview and quick-start)
- `module/` — RTL and testbench sources
- `notes.md` — design thoughts, daily logs, and pre-commit change drafts
- `changelog.md` — optional external changelog
- `scripts/` — helpers (run_remote, log_change)

Quick start (remote simulation / Vivado XSim)

- Sync this experiment to your Linux machine with Vivado installed (see [Research/Experiments/README.md](Research/Experiments/README.md) for SSH/rsync patterns).
- Example remote flow (Vivado `xvlog`/`xelab`/`xsim`):

```bash
# on local machine
rsync -av --exclude '.git' ./ user@remote:/home/user/sim-work/fp-experiment/

# on remote machine (source Vivado env first):
source /opt/Xilinx/Vivado/<version>/settings64.sh
xvlog --sv module/*.sv tb/*.sv
xelab -debug typical <top_module> -s sim_snapshot
xsim sim_snapshot -R | tee output/sim.log
```

Metrics

- Correctness (mismatches vs software reference), latency (cycles), throughput (ops/cycle), timing (fmax), and resource usage (LUT/FF/BRAM).

Design / Method

- Setup RTL in `module/`, create a SystemVerilog TB in `module/tb/`, and add Python/Numpy reference generators for randomized verification.
- Procedure:
    1. Implement baseline combinational reference.
    2. Add pipelining stages (alignment, normalization, rounding) and verify per-stage correctness.
    3. Run randomized tests (10k+) and compare to reference.
    4. Synthesize for target device and capture utilization/timing data.

Notes and logging

- Use `notes.md` for iterative thoughts and pre-commit drafts. When ready, prepend entries into the source files' in-file changelog using the helper scripts in `experiment-template/scripts/`.
- Example in-file header:

```
=== IN-FILE CHANGELOG ===
2026-06-12 | ajayc | commit: abc123 | Add baseline 32-bit FP adder
- file: module/fp_adder.sv
- details: implemented alignment stage; included normalization unit and baseline rounding
=== END CHANGELOG ===
```

Results and artifacts

- Store simulator logs, waveforms (`.wdb`), and synthesis reports in an `output/` folder and reference them here.

Status

- [ ] Planned  - [ ] In progress  - [ ] Complete

Next steps

- Create `module/` with the initial baseline adder and `notes.md` entries. I can add a `scripts/run_vivado.sh` template to `experiment-template/scripts/` if you'd like an automated Vivado-run wrapper.
