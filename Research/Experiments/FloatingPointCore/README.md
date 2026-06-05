# Floating Point Core Experiments

This folder collects experiments related to the floating-point GPU core: adders, multipliers, pipelining strategies, and integration tests.

## Core

## Objective
Validate and prototype the GPU core datapath responsible for floating-point operations, focusing on a 32-bit floating-point adder and extendability to parallel execution.

## Hypothesis
A pipelined approach with separate exponent and mantissa handling will allow a 32-bit floating-point adder to meet timing with acceptable area on our target FPGA.

## Goals
- Create a simple hardware datapath for floating-point operations (add, multiply).
- Design for extendability to parallel lanes.
- Learn the implementation details required for multi-cycle or pipelined floating-point adders.

## Method
- **Setup:** RTL in `HDL/`, simulation with a SystemVerilog testbench, reference checks with Python/numpy.
- **Procedure:**
    1. Implement baseline combinational 32-bit adder.
    2. Add pipelining stages for alignment, normalization, rounding.
    3. Run 10k random vectors and compare to software reference.
    4. Synthesize for target device and measure timing and utilization.
- **Metrics:** Correctness (mismatches), cycle time, LUT/FF usage, latency.

## Idea
- [ ] Create a floating-point (32-bit) adder that can add two floats per cycle (or within target latency budget).

## Results
- Summary: TBD — fill in after running simulations and synthesis.
- Raw data: link waveforms, logs, and synthesis reports here when available.

## Analysis
- Interpretation of results and suggested next steps go here after experiments complete.

## Status
- [ ] Planned  - [x] In progress  - [ ] Complete

## Failures / Lessons Learned
- Use this section to record failed approaches, debugs, and key learnings.
