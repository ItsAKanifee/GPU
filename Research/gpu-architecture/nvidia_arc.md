# Nvidia Architecture

## Source

<https://archive.docs.nvidia.com/nsight-graphics/2025.5/UserGuide/gpu-trace-system-architecture.html>

## Notes & Summary

*Summary:*

The linked Nvidia Nsight Graphics "GPU Trace — System Architecture" guide describes how GPU Trace visualizes hardware units and pipeline stages to help debug and optimize graphics and compute workloads. It covers the GPU logical layout (world pipe, screen pipe, SMs, caches), per-unit throughput and occupancy metrics, common reasons warps fail to launch, async compute behavior, and memory/PCIe bandwidth diagnostics. The guide explains how to interpret rows and counters (Unit Throughputs, SM Occupancy, L1 Throughput, VRAM, PCI Bandwidth) to identify bottlenecks and actionable optimizations.

*Notes (practical takeaways):*

- Unit Throughputs: watch %-of-max for each hardware unit; multiple units can be near 100% concurrently — helps locate which unit(s) limit frame time.
- SM Occupancy: warp-slot residency shows when warps are present; gray regions indicate no free slots — use to detect warp/allocation limits.
- Async Compute: detect concurrent compute via separate ASYNC_COMPUTE queue rows and the "Compute In Flight" counter.
- Look at the Image For Understanding Certain Features within an Nvidia GPU
