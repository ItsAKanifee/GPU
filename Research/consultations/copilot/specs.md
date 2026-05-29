# Specs
## Converstation Link:
https://copilot.microsoft.com/shares/pages/UtpnpzzecBwW8KKNLzUrG

## Conversation:

If you want a concrete bullet list to design toward:

- 1 SM, SIMT core
    - Warp size: 8
    - Resident warps: 2–4

Datapath

32‑bit INT ALU (optional multi‑cycle FP16/FP32)

Memory (within 256 KB)

16–32 KB instruction memory

4–16 KB register file

8–16 KB shared memory

Remaining as global buffer

Control

Simple round‑robin warp scheduler

In‑order pipeline, 3–5 stages

Minimal SIMT ISA

If you want, next step we can sketch a block diagram with labeled modules and rough SRAM sizes so you can sanity‑check it against that 2 Mb budget and your course’s toolflow.