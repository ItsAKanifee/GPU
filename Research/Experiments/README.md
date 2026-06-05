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
