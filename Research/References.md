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

- ACM/IEEE MICRO 2007 — "Detailed GPU Warp Scheduling and SM Architecture"
  - URL: <https://dl.acm.org/doi/pdf/10.1109/MICRO.2007.12>
  - Referenced in: `diagrams/researched/Detailed_SM.md`, `gpu-architecture/warp_formation.md`
  - Notes: Classic GPU architecture paper describing streaming multiprocessor organization, warp scheduling, branch handling, and concurrent execution behavior; directly relevant to SIMT and thread-formation concepts.

- Stack Exchange — "How does signed floating point adder implement?"
  - URL: <https://cs.stackexchange.com/questions/164737/how-does-signed-floating-point-adder-implement>
  - Referenced in: `diagrams/researched/FP_Adder.md`
  - Notes: Practical explanation of the signed floating-point adder datapath, including exponent alignment, mantissa addition, and normalization.

- SciSpace — "WarpPool: Sharing Requests with Inter-Warp Coalescing"
  - URL: <https://scispace.com/pdf/warppool-sharing-requests-with-inter-warp-coalescing-for-3yqgz2qq0a.pdf>
  - Referenced in: `gpu-architecture/memory_requests.md`
  - Notes: Discusses how memory requests are coalesced across warps and how GPU memory access patterns affect throughput and latency.

- NVIDIA — "Parallel Thread Execution (PTX) ISA"
  - URL: <https://docs.nvidia.com/cuda/parallel-thread-execution/index.html>
  - Referenced in: `gpu-architecture/nvidia-isa.md`
  - Notes: Vendor documentation for the NVIDIA thread-execution model and instruction semantics, useful for understanding warp behavior, memory operations, and control flow at the ISA level.
