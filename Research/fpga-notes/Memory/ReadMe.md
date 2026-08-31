# Memory Layout

## Purpose

Upon realizing challenges with memory retrieval in a SIMD system, I decided to experiment with making a memory model. This directory acts as a space to experiment with memory retrival in a GPU, and test ideas such as a *memory coelescer*

## Challenges

- SIMD archtiecture can call for multiple memory calls at once
- Sometimes, the lanes may call the same points in memory, other times, calls may be distinct
- Memory calls inherintly slowdown GPU process

## Ideas

- Memory Coellecer: Gathers all memory calls within a warp and consolidates the same calls to the same cache line
