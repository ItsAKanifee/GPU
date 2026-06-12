# Experiments

## Purpose

This folder contains reproducible experiments, component validations, and microbenchmarks that inform GPU design decisions. Each experiment documents a hypothesis, the method used to validate it, the results, and the resulting design implications.

## Scope

In scope:

- Component validation (e.g., adders, ALUs, memory timing)
- Design tradeoff analysis (precision vs. area, latency vs. throughput)
- Microbenchmarks and performance characterization
- RTL simulation and synthesis metrics

Out of scope:

- General research notes (use `Research/Preliminary/` or `Research/gpu-architecture/`)
- Meeting notes and consultations (use `Research/consultations/`)

## Experiment Template

Use the structure below for new experiment documents. Keep entries concise (1–2 pages) and link large raw data files (waveforms, logs, reports) from the `FPGA Protoype/`, `HDL/`, or `Host/` folders.

```
# <Experiment Name>

## Objective
Brief statement of what you're testing or validating (1–2 sentences).

## Hypothesis
What you expect to find or prove (1–2 sentences).

## Method
- **Setup:** Tools, simulator/synthesis versions, target device, and testbench description.
- **Procedure:** Step-by-step reproduction instructions.
- **Metrics:** What you measure (latency, area, power, correctness).

## Results
- **Summary:** Key findings (bullets or table).
- **Raw data:** Links to waveforms, logs, reports.

## Analysis
- Interpretation of results and whether the hypothesis held.
- Design implications and recommended next steps.

## Status
- [ ] Planned  - [ ] In progress  - [ ] Complete
```

## How to Contribute

1. Add a new experiment file named using the pattern: `component-testtype.md` (e.g., `adder-precision.md`).
2. Copy the template above into the new file and fill in Objective, Hypothesis, Method, Metrics/Success Criteria, Results, Analysis, and Attachments.
3. Link raw data from the appropriate folder rather than embedding large files.
4. Update this README's index (see below) with the experiment name and status.

## Current Experiments

| Experiment | Component | Status | Notes |
|---|---:|---:|---|
| [Floating Point Core](FloatingPointCore/README.md) | Floating-point adder | [ ] In progress | See `Research/Experiments/FloatingPointCore/README.md` for details |
| [Integer Core](IntCore/README.md) | Integer ALU datapath | [ ] Planned | See `Research/Experiments/IntCore/README.md` for details |

## Example: Floating-Point Adder Validation

### Objective

Validate that a 32-bit IEEE-754 floating-point adder meets timing and correctness targets on the target FPGA.

### Hypothesis

A pipelined exponent/mantissa alignment and CLA-style mantissa adder will meet 100 MHz timing with acceptable area.

### Method

- **Setup:** Vivado 2021.2, target: Spartan-7 XC7A35T, SystemVerilog testbench, 10k random vectors generated with Python.
- **Procedure:**
    1. Synthesize the adder with timing constraints.
    2. Run functional simulations and compare against a software reference (numpy).
    3. Collect post-synthesis timing and utilization numbers.
- **Metrics:** Cycle time, LUT/FF usage, mismatches against reference.

### Results

- **Summary:** Passed 10k random vectors (0 mismatches). Timing: 9.8 ns (≈102 MHz). Area: 1,240 LUTs.
- **Raw data:** link waveforms, reports, and logs from the appropriate folder.

### Analysis

Adder meets current timing and area targets. Next: integrate into ALU and run end-to-end datapath tests.

## Recommended Workflow

1. Check existing experiments to avoid duplication.
2. Document hypothesis and method as you run experiments.
3. Store large outputs in `FPGA Protoype/`, `HDL/`, or `Host/` and link them here.
4. After completion, update the status and add a brief summary to the index above.

## References

- See `Research/References.md` for external resources.
- See `Research/gpu-architecture/` for architecture-level context.

## Experiments — Running SystemVerilog tests remotely

Purpose:

- Notes and instructions for running experiment simulation and tests on a remote tester over SSH (when the simulator is not installed locally).

Prerequisites:

- SSH access to a remote machine with a SystemVerilog simulator (VCS, Questa, Icarus, etc.).
- `ssh` and `scp` available locally.
- A remote working directory where you can run builds and simulations.

Quick steps:

1. Copy the experiment folder (or specific files) to the remote host:

```powershell
scp -r Research/Experiments/my-adder-experiment user@remote:/home/user/sim-work/my-adder-experiment
```

1. SSH to the remote host and run the simulator or test script:

```powershell
ssh user@remote
cd /home/user/sim-work/my-adder-experiment
# example: run a Makefile target or simulator command
make sim
# or
vcs -full64 -sverilog module/*.sv tb/*.sv -o simv && ./simv +UVM_TESTNAME=...
```

1. Retrieve results/logs back to local machine:

```powershell
scp user@remote:/home/user/sim-work/my-adder-experiment/output/*.log Research/Experiments/my-adder-experiment/output/
```

Tips and recommendations

- Create a small remote-run script in the experiment's `scripts/` directory (e.g., `run_remote.sh`) that builds and runs the test; then call it over SSH: `ssh user@remote '/home/user/sim-work/my-adder-experiment/scripts/run_remote.sh'`.
- Use a separate remote workspace per experiment to avoid cross-contamination: `/home/user/sim-work/<experiment-name>`.
- If multiple files change often, consider `rsync -av --delete` instead of `scp` to sync only diffs.
- Capture simulator outputs to a versioned `output/` folder so you can compare runs.

Automating from local (example)

```powershell
# sync, run, and fetch logs
rsync -av --exclude '.git' Research/Experiments/my-adder-experiment/ user@remote:/home/user/sim-work/my-adder-experiment/
ssh user@remote '/home/user/sim-work/my-adder-experiment/scripts/run_remote.sh'
rsync -av user@remote:/home/user/sim-work/my-adder-experiment/output/ Research/Experiments/my-adder-experiment/output/
```

Security

- Use SSH keys with passphrases and an agent for repeated operations.
- Avoid storing plaintext credentials in scripts.

If you want, I can:

- create a `scripts/run_remote.sh` template inside `experiment-template/scripts/` (bash) and a local `scripts/run_remote.ps1` caller for Windows (PowerShell).  
- or add a `rsync`-based helper in the template to make sync+run+fetch a single command.
