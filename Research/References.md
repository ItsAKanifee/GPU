# Research References (collected)

This file lists external articles and resources referenced in the `Research/` notes so far.

- GPU Demystified — "Introduction to GPU architectures and programming"
  - URL: <https://gpudemystified.com/articles/introduction-to-gpu-architectures-and-programming/>
  - Referenced in: `gpu-architecture/Fundummentals.md`
  - Notes: Beginner-friendly walkthrough of CUDA, kernels, thread hierarchy, warps, and SMs.

- Drilian — "Floating-point numbers and rounding"
  - URL: <https://drilian.com/posts/2023.01.10-floating-point-numbers-and-rounding/>
  - Referenced in: `Preliminary/FLOPS.md`
  - Notes: IEEE-754 explanation, mantissa/exponent/sign, rounding and subnormals.

- ENCCS — "Introduction to GPU architecture"
  - URL: <https://enccs.github.io/openmp-gpu/gpu-architecture/>
  - Referenced in: `gpu-architecture/Intro to GPU Architecture.md`
  - Notes: Structured course material covering SMs, memory types, SIMT scheduling, and streams.

- YouTube — GPU lecture / primer
  - URL: <https://www.youtube.com/watch?v=h9Z4oGN89MU&list=WL&index=1&t=1493s>
  - Referenced in: `Preliminary/GPU_Basics.md`
  - Notes: Recorded lecture / primer (YouTube); follow the video for conceptual walkthroughs and demos.

- Copilot share — internal spec link
  - URL: <https://copilot.microsoft.com/shares/pages/UtpnpzzecBwW8KKNLzUrG>
  - Referenced in: `consultations/copilot/specs.md`
  - Notes: Shared Copilot session link; contains AI-assisted discussion and specs.

- Medium — "Understanding GPU architecture: basics and key concepts"
  - URL: <https://medium.com/ai-insights-cobet/understanding-gpu-architecture-basics-and-key-concepts-40412432812b>
  - Referenced in: `Preliminary/Understanding_GPUs.md`
  - Notes: Blog overview of GPU architecture concepts (high-level primer).

- Scale Computing — "Understanding GPU Architecture"
  - URL: <https://www.scalecomputing.com/resources/understanding-gpu-architecture>
  - Referenced in: `gpu-architecture/more_architecture.md`, `consultations/copilot/essentials.md`
  - Notes: Vendor/educational overview covering GPU structure and performance considerations.

- Copilot share — additional internal spec link
  - URL: <https://copilot.microsoft.com/shares/pages/BYH6RXGfwTZEFJ6aGU7wE>
  - Referenced in: `consultations/copilot/essentials.md`
  - Notes: Another Copilot session share containing notes and discussions from consultations.

- Nvidia Nsight Graphics — "GPU Trace — System Architecture"
  - URL: <https://archive.docs.nvidia.com/nsight-graphics/2025.5/UserGuide/gpu-trace-system-architecture.html>
  - Referenced in: `gpu-architecture/nvidia_arc.md`
  - Notes: Developer guide describing GPU logical units, throughput and occupancy metrics, L1/VRAM/PCI diagnostics, async compute behavior, and warp-launch limit analysis — useful for profiling and optimization with Nsight Graphics.

- AMD GCN3 — "Instruction Set Architecture (high-level)"
  - URL: <https://docs.amd.com/v/u/en-US/gcn3-instruction-set-architecture>
  - Referenced in: `gpu-architecture/amd_isa.md`
  - Notes: High-level description of AMD's GCN3 GPU instruction set architecture; broad architectural overview useful as a complement to vendor-specific profiling guides.
