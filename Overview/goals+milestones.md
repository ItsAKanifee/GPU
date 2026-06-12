# Goals

## Overall Goals

- [x] Understand the workings and core components of a GPU
- [ ] Create a basic implementation able to run simple tasks like matrix multiplication
- [ ] Allow for the GPU to be 'programmed'
- [ ] Have it draw 2D shapes

## Design Goals

- 1 SM, SIMT core
  - Warp size: 8
  - Resident warps: 2–4

- Datapath
  - 32‑bit INT ALU (optional multi‑cycle FP16/FP32)

- Memory (within 256 KB)
  - 16–32 KB instruction memory
  - 4–16 KB register file
  - 8–16 KB shared memory
  - Remaining as global buffer

- Control
  - Simple round‑robin warp scheduler
  - In‑order pipeline, 3–5 stages
  - Minimal SIMT ISA
