# Specs
## Converstation Link:
https://copilot.microsoft.com/shares/pages/UtpnpzzecBwW8KKNLzUrG

## Hardware-focused summary 

- Area / budget: ~1 mm × 1 mm die slot, core ~700 µm × 700 µm, ~200k gates, ~2 Mb SRAM (~256 KB on-chip). Tight area — scope must be constrained.

- Target core: single small SIMT SM (1 SM). No multiple SMs.

- Parallelism:
    - Warp (lane) size: 8 (16 if area allows).
    - Resident warps per SM: 2–4.
    - Minimal/initially no warp divergence support (assume all lanes follow same path).

- Datapath / ISA:
    - Primary width: 32-bit INT ALU.
    - Optional FP16/FP32 allowed only as multi-cycle or time-shared unit (to save area).
    - Minimal ISA: basic ALU ops, MOV/CMP/SEL, LD/ST (global), LD/ST shared, simple branch.

- Memory (example split to fit ~256 KB):
    - Instruction memory: 16–32 KB.
    - Register file: 4–16 KB (e.g., WARP=8, NUM_WARPS=4, REGS/thread=32 → ~4 KB).
    - Shared memory (scratchpad): 8–16 KB.
    - Global buffer / staging window: remaining SRAM (e.g., 128–200 KB) for data staging to/from off-chip.

- Control & pipeline:
    - Scheduler: simple round‑robin across ready warps.
    - Execution: in-order per-warp; simple hazard handling (stall-on-hazard / basic scoreboard).
    - Pipeline depth: 3–5 stages (IF → ID → EX → MEM → WB); MEM/WB may be collapsed.

- Implementation tradeoffs / constraints:
    - Avoid wide datapaths, large register files, large shared caches, or complex FP/tensor units (area-expensive).
    - Favor simplicity: multi‑cycle FP if needed, minimal divergence, simple scheduler.
    - Design should be parameterized for FPGA (larger knobs) then scaled down for ASIC.

- Expected capabilities:
    - Small data-parallel kernels: vector add, SAXPY, reductions, small stencils, tiled small matrix blocks.
    - Demonstrates SIMT semantics and shared-memory tiling but not high-end ML matrix throughput.