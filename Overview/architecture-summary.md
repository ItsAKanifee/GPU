# Architecture Summary

## Objective

This document provides the layout and design of the planned GPU architecture for the project. It outlines the key components, their roles, and how they interact to execute graphics and compute workloads efficiently. The design is based on research from various sources, including vendor documentation and academic resources, to provide a comprehensive understanding of modern GPU design.

## Key Components

Here is a list of need-to-know components for the architecture of this GPU. While this design is based off of designs from Nvidia and AMD, naming conventions of certain components may differ from the origianl sources.

### Single Thread Components

- *ALU:* Performs integer and floating-point (*subject to change*) arithmetic and logical operations, providing the core computations for the GPU processes

- *Data_Register:* A 32-bit wide register that can store multiple values at a time. It can be written to by the ALU and read from ports A and B.

- *Lane:* A single thread of execution within a block. Each lane has its own distinct identifier and can read and write values to its own data register. Lanes perform data operations on received memory and pass results back to shared memory.

- *Thread_Register:* Stores the current location of the lane within the block and which block it is in. This identifier is used to access specific portions of shared memory.

### Shared Components

- *Instruction Register:* Holds the current instruction being executed by the GPU, allowing for proper sequencing and control of operations (shared with all lanes in a block)


## Execution Model & Parallelism

- SIMT/SIMD-style execution: groups of lanes (blocks) execute the same instruction in lockstep.
- Warp divergence serializes execution when threads in a warp take different control-flow paths.
- Hardware hides latency via high concurrency (many resident warps) and fast context switching among warps.

## Memory Hierarchy & Performance

- Registers: fastest per-thread storage; spills to local/global memory are costly.
- Shared memory: banked; avoid bank conflicts for best throughput.
- Global memory: highest capacity, highest latency; coalesced, aligned accesses reduce transactions and improve throughput.
- Memory bandwidth and cache behavior are primary performance drivers in data-parallel workloads.

## Design Goals (project-specific)

- Prototype target: single SM design to validate functional datapath and scheduler.
- Warp size: 8 lanes (configurable); resident warps: 2–4 for latency hiding.
- Datapath: 32-bit integer ALU baseline (optional multi-cycle FP units later).
- Memory budget example: small on-chip memory (8–16 KB shared), register file and instruction memory sized to fit prototype constraints.
- Control: simple round-robin warp scheduler; in-order pipeline (3–5 stages) is a practical baseline.

*Plan subject to change as research and prototyping progress.*

## Diagrams

- Stored in `Research/diagrams/researched/` and `Diagrams/` for reference and reuse in slides, documentation, and FPGA prototype planning.

## References

- See `Research/References.md` for collected sources and reading links
