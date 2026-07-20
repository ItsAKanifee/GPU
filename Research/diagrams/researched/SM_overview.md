# Volta SM Architecture

This file collects SM-block diagrams and annotations for reuse in documentation and slides.

## Source diagrams

- ENCCS course SM diagram:
  - URL: <https://enccs.github.io/openmp-gpu/_images/volta-sm-architecture.png>
  - Notes: Shows execution units, register file, shared memory, and L1 cache placement.

## Annotated notes

- Execution pipeline: Fetch/Decode -> Scheduler -> ALUs -> Writeback
- Key on-chip resources: register file, shared memory (scratchpad), L1 data cache
- Useful for: mapping lane/datapath replication and scheduler placement in FPGA prototype
