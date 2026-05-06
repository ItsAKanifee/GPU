# Introduction to GPU Architecture

## Source

https://enccs.github.io/openmp-gpu/gpu-architecture/

## Summary

### Why Use GPUs
- Term GPU is sometimes used interchangebly with the term accelerator
- GPUs provide much higher instruction throughput and memory bandwidth than CPUs

- Warp

### GPU Model

- Accelerators:
    - Seperate from main circuit board
    - Contain own processor, memory, power, etc.
    - Model:
        ![alt text](image.png)

- Basics:
    - GPUs are made up of multiple multiprocessors
        - Each multiprocessor contains its own register file