# Experiments (overview)

This folder contains short, reproducible experiments and microbenchmarks that inform GPU design decisions. Each experiment should follow the project experiment template so results and reproduction steps are consistent across work.

What belongs here

- Component validations and microbenchmarks (e.g., adders, ALUs, FP datapath)
- Design tradeoff analysis (precision vs. area, latency vs. throughput)
- Simulation and synthesis experiments with reproducible inputs and outputs

What to keep out

- General research notes, meeting minutes, or consultations — put those in `Research/Preliminary/` or `Research/consultations/`.

Templates & helpers

- Experiment template and guidance: [Research/Experiments/experiment-template/README.md](Research/Experiments/experiment-template/README.md)
- Notes template: [Research/Experiments/experiment-template/notes.md](Research/Experiments/experiment-template/notes.md)
- In-file changelog template: [Research/Experiments/experiment-template/changelog_template.md](Research/Experiments/experiment-template/changelog_template.md)
- Helper scripts (log-change, run scripts): [Research/Experiments/experiment-template/scripts/](Research/Experiments/experiment-template/scripts/)

Quick workflow

1. Create a new experiment directory under this folder (use a descriptive name).
2. Copy the experiment template into the experiment folder and fill `Objective`, `Hypothesis`, `Method`, `Metrics`, `Results`, and `Analysis`.
3. Draft detailed change-by-change notes in `notes.md` inside the experiment folder; use the helper scripts to prepend in-file changelog entries when ready.
4. Use `rsync` to sync to a Linux tester or use the provided `run_vivado.sh` wrapper for Vivado/XSim runs (see `scripts/`).

Examples

- Floating-point core experiments: [FloatingPointCore/README.md](FloatingPointCore/README.md)
- Integer core experiments: [IntCore/README.md](IntCore/README.md)

Keeping artifacts

- Store large logs, waveforms, and synthesis reports in an `output/` directory inside the experiment folder and reference them from the experiment README.

Need help?

- I can add example `module/` starters, or create a `run_remote.sh` wrapper for automatic sync+run+fetch if you want. Reply with which experiment to bootstrap and I'll create the files.
