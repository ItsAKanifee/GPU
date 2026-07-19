# Memory Hierarchy (GPU) Diagrams and Notes

This file collects memory-hierarchy diagrams and annotations.

## Source diagrams

- ENCCS hardware review diagram:
  - URL: <https://enccs.github.io/openmp-gpu/_images/HardwareReview.png>
  - Notes: Shows host, interconnect, memory controller, VRAM, and SMs.

## Key points

- Registers: per-thread, fastest, limited capacity — impacts occupancy.
- Shared memory / L1: software-managed or programmer-visible low-latency storage.
- L2 / VRAM: unified cache and off-chip high-capacity memory; bandwidth is critical.

## Usage

- Export or screenshot the source diagrams for `Diagrams/` with attribution and add annotations mapping to prototype resources (BRAM, LUTs, external memory).
