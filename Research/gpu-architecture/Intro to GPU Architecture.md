# Introduction to GPU Architecture

## Source

https://enccs.github.io/openmp-gpu/gpu-architecture/

## Summary

### Why Use GPUs
- Term GPU is sometimes used interchangebly with the term accelerator
- GPUs provide much higher instruction throughput and memory bandwidth than CPUs

### Differences btwn GPUs and CPUs
- CPUs:
    - Designed to execute a sequence of operations (thread) as fast as possible
    - Combats latency w/ data laches and control flow
        

- GPUs:
    - Designed to operate on large sums of data in parallel
    - Combats latency w/ large amount of computation

### GPU Programming Model

- Accelerators: