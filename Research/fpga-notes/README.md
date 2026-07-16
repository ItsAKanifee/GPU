# FPGA-Notes (overview)

This folder contains experimentation to create certain aspects of the GPU architecutre and components. Each folder documents the progress of designing each component, along with brainstorming and challenges.

## What belongs here

- Component validations and microbenchmarks (e.g., adders, ALUs, FP datapath)
- Design tradeoff analysis (precision vs. area, latency vs. throughput)
- Simulation and synthesis experiments with reproducible inputs and outputs

## Templates & helpers

- Experiment template and guidance: [Research/Experiments/experiment-template/README.md](Research/Experiments/experiment-template/README.md)
- Notes template: [Research/Experiments/experiment-template/notes.md](Research/Experiments/experiment-template/notes.md)
- In-file changelog template: [Research/Experiments/experiment-template/changelog_template.md](Research/Experiments/experiment-template/changelog_template.md)
- Helper scripts (log-change, run scripts): [Research/Experiments/experiment-template/scripts/](Research/Experiments/experiment-template/scripts/)

## Quick workflow

1. Create a new experiment directory under this folder (use a descriptive name).
2. Copy the `experiment-template/` and write out the `ReadMe.md` for the specific component being designed
3. Draft detailed change-by-change notes in `notes.md` inside the experiment folder; use the helper scripts to prepend in-file changelog entries when ready.

## Keeping artifacts

- Store large logs, waveforms, and synthesis reports in an `output/` directory inside the experiment folder and reference them from the experiment README