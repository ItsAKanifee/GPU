# Introduction to GPU Architecture

## Source

https://enccs.github.io/openmp-gpu/gpu-architecture/

## Summary
### Why use GPUs
- The term GPU is often used interchangeably with "accelerator".
- GPUs offer much higher instruction throughput and memory bandwidth than CPUs for data-parallel workloads.

### GPU / accelerator model
- Accelerators are separate devices that include processor, memory, and power management, and operate under a host (CPU) that controls execution and data movement.

![Accelerator model](https://enccs.github.io/openmp-gpu/_images/HardwareReview.png)

### Multiprocessors (SMs) and basic building blocks
- GPUs are composed of many streaming multiprocessors (SMs). Each SM contains execution units, registers, and shared (L1) memory.
- Typical SM resources (example: NVIDIA Volta):
  - 64 single-precision cores, 32 double-precision cores, 64 integer cores, 8 Tensor cores
  - 128 KB L1 / shared memory (configurable), and 65,536 registers

![Volta SM overview](https://enccs.github.io/openmp-gpu/_images/volta-sm-architecture.png)

### Parallelism & programming model
- A kernel launches many threads; threads execute the same instructions on different data (SIMD/SIMT model).
- Software ⇄ hardware mapping:
  - Thread maps to a scalar processor / core
  - Thread block maps to an SM
  - Kernel maps to the device
- Threads in a block can synchronize and share data via shared memory; different blocks are independent and may run in any order.


### Memory hierarchy (high level)
- Global memory: accessible to all threads; highest capacity but highest latency.
- Registers: fastest per-thread storage; limited in quantity; spills to local memory hurt performance.
- Shared memory (user-managed L1): low-latency on-chip memory shared by threads in a block; banked — avoid bank conflicts for best performance.
- Other specialized memories: constant, texture, and surface memories with specific access patterns and caching behaviors.


### Warps / SIMT scheduling
- Hardware groups threads into warps (32 threads on CUDA, 64 in some vendors). All threads in a warp execute the same instruction in lockstep (SIMT).
- Warp divergence (threads in a warp taking different branches) serializes execution and reduces efficiency.


### Performance considerations
- Memory coalescing: global memory transactions are issued per warp in 32/64/128-byte segments; aligned, contiguous accesses are critical to reduce transactions.


### Summary / key points
- GPUs excel at throughput for data-parallel problems; CPU remains the host and orchestrator.
- Efficient GPU code requires thinking about thread/block mapping, memory hierarchy, coalescing, shared memory, and warp behavior.
- Use profiling and hardware-aware tuning to expose performance.
