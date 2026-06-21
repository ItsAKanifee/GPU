# Programming GPUs

## Source

<https://gpudemystified.com/articles/introduction-to-gpu-architectures-and-programming/?utm_source=copilot.com#brief-introduction-to-gpus>

## Notes (summary)

- Purpose: GPUs are massively parallel processors optimized for running the same instruction over many data elements (SIMD model). Good for graphics, ML, simulations, and other data-parallel workloads.

- CPU vs GPU:
  - CPU: few complex cores, general-purpose, handles OS and I/O.
  - GPU: thousands of simpler cores, organized for parallel throughput (e.g., CUDA cores, Tensor Cores).

- Memory model and data movement:
  - GPU uses device memory (VRAM); CPU and GPU have separate address spaces.
  - Allocate device memory with `cudaMalloc`, copy with `cudaMemcpy` (HostToDevice / DeviceToHost), free with `cudaFree`.
  - Always copy input data to device before launching kernels and copy results back afterwards.

- Thread hierarchy & indexing:
  - Grid → Blocks → Threads. Blocks can be 1D/2D/3D; threads per block limited (commonly 1024 max).
  - Global thread index example: `int i = blockIdx.x * blockDim.x + threadIdx.x;` Use `if (i < N)` to avoid overruns.

- Warps and SIMD effects:
  - Hardware groups threads into warps (32 threads on NVIDIA) that execute in lockstep.
  - Warp divergence (threads in a warp taking different branches) reduces efficiency.
  - Use intra-warp primitives (shuffle/ballot) when appropriate.

- Architecture overview:
  - Streaming Multiprocessors (SMs) contain execution blocks, shared memory, and manage multiple warps in flight.
  - SMs keep dozens of warps in-flight to hide latency; modern GPUs have many SMs (e.g., up to 144 SMs on some architectures)

- Takeaway: While the software side of GPU programming is much more higher level than the project, understanding the basics of how CUDA works is helpful in understanding the design goals of the project, and the functionality of a GPU with software and how it differentiates from a CPU
