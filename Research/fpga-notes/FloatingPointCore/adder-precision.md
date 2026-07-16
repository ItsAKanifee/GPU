# Adder Precision Experiment

## Objective

Measure accuracy and area impact of different mantissa rounding/normalization strategies for a 32-bit floating-point adder.

## Hypothesis

Changing rounding modes or reducing mantissa width will trade off correctness for area and timing; a targeted reduction may yield significant area savings with acceptable error rates for some workloads.

## Method

- **Setup:** SystemVerilog RTL for adder variants, simulation with Python reference (numpy), synthesis with Vivado for target FPGA.
- **Procedure:**
  1. Implement variants: full 23-bit mantissa, reduced mantissa (e.g., 20-bit), and alternative rounding modes.
  2. Generate 100k random vector pairs and compare hardware outputs to numpy reference.
  3. Collect mismatch counts, distribution of error magnitudes, and post-synthesis area/timing numbers.
- **Metrics:** Mismatch count, mean/median/max error, LUT/FF usage, timing (ns).

## Results

- **Summary:** (fill after experiment)
- **Raw data:** (link to waveforms/logs/reports)

## Analysis

- (Interpret results and recommend mantissa width/rounding mode)

## Status

- [ ] Planned  - [ ] In progress  - [ ] Complete
