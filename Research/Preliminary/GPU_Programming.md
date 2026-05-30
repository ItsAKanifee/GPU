# Programming GPUs

## Source:
https://gpudemystified.com/articles/introduction-to-gpu-architectures-and-programming/?utm_source=copilot.com#brief-introduction-to-gpus

## Notes (summary)

- Purpose: GPUs are massively parallel processors optimized for running the same instruction over many data elements (SIMD model). Good for graphics, ML, simulations, and other data-parallel workloads.

- CPU vs GPU:
	- CPU: few complex cores, general-purpose, handles OS and I/O.
	- GPU: thousands of simpler cores, organized for parallel throughput (e.g., CUDA cores, Tensor Cores).

- CUDA Programming Essentials:
	- CUDA lets you write host (CPU) and device (GPU) code in one file. The compiler `nvcc` separates and compiles host and device code.
	- Kernels: mark functions with `__global__` to run on the GPU.
	- Launch syntax: `kernel<<<gridDim, blockDim>>>(...)` — specify blocks and threads per block.

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

- Performance tips and profiling:
	- Use many threads (map one thread per data element) instead of serial loops on a single thread.
	- Block size affects performance; experiment (e.g., 256 vs 1024) — best size depends on hardware and kernel.
	- Profile with NVIDIA Nsight Compute and/or measure with CUDA events (`cudaEventRecord`, `cudaEventElapsedTime`).

- Debugging:
	- Use Nsight Visual Studio Edition for kernel debugging, warp inspection, SASS/PTX view, and memory inspection.
	- Can set breakpoints in kernels and inspect variables across threads/warps.

- Architecture overview:
	- Streaming Multiprocessors (SMs) contain execution blocks, shared memory, and manage multiple warps in flight.
	- SMs keep dozens of warps in-flight to hide latency; modern GPUs have many SMs (e.g., up to 144 SMs on some architectures).

- Practical takeaways:
	- Write kernels that maximize parallelism, minimize divergence, and exploit shared memory when needed.
	- Tune block/grid sizes and memory access patterns; always profile to find bottlenecks.

## References / Next reading
- Original article: https://gpudemystified.com/articles/introduction-to-gpu-architectures-and-programming/
- Official CUDA docs and Nsight documentation for setup, examples and deeper optimization guides.
