# Integer Core Experiments

Purpose

- Prototype and validate integer-core datapath components (ALU, adders, multipliers, shifters) and their integration with control and pipeline stages.

Hypothesis

- Ripple-carry or carry-lookahead designs with targeted pipelining will meet frequency/area targets and provide a baseline for comparison with floating-point units.

Structure

- `README.md` — this overview and quick-start notes.
- `module/` — RTL sources (HDL/SystemVerilog, tests)
- `alu_datapath.md` — An overview over the thought process and experimentation of the datapath
- `warp.md` — An overview over the thought process and experimentation of the warp
- `notes.md` — design thoughts, daily logs, and pre-commit change drafts.
- `changelog.md` — optional per-experiment changelog (human-readable history).
- `scripts/` — helper scripts (remote-run, logging helpers).

Quick start (remote simulation)

- Sync this experiment to a Linux host with a simulator (see [Research/Experiments/README.md](Research/Experiments/README.md) for SSH/rsync patterns).
- Typical flow on remote Vivado/XSim machine:

```bash
# on local machine
rsync -av --exclude '.git' ./ user@remote:/home/user/sim-work/intcore-experiment/

# on remote machine (example using Vivado xsim):
source /opt/Xilinx/Vivado/<version>/settings64.sh
xvlog --sv module/*.sv tb/*.sv
xelab -debug typical <top_module> -s sim_snapshot
xsim sim_snapshot -R | tee output/sim.log
```

In-file changelog

- Add a structured changelog header at the top of edited source files. Example:

```
=== IN-FILE CHANGELOG ===
2026-06-12 | ajayc | commit: abc123 | Add parameterized adder width
- file: module/fp_adder.sv
- details: replaced generate-based carry with explicit loop to simplify verification; adjusted WIDTH parameter
=== END CHANGELOG ===
```

Links

- Template: [Research/Experiments/experiment-template/README.md](Research/Experiments/experiment-template/README.md)
- Notes template: [Research/Experiments/experiment-template/notes.md](Research/Experiments/experiment-template/notes.md)

Status

- Planned / In progress / Complete — update this file's `Status` section as work progresses.

Next steps

- Add a `module/` folder for the first ALU experiments, include `notes.md` and a `scripts/run_remote.sh` tailored to your remote tester.
