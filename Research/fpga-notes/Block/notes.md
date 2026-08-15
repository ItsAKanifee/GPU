# Block Notes

## Overview

This document is a place where I right down my progress and ideas as I proceed with the project.

## Notes + Log

- **7/15/26:** Ok, so I tested the current lane design with 8 instances in parallel and it can run basic vector operations, I will see test loading in vector multiplication and see if that works

- **7/24/26:** So I have been trying to figure out how to continue on with the block, more specifically, I need to start thinking about memory retrieval and instruction branching. Both require the use of caches (which I do not know much about, only that they store the reuqested peice of memory and following data points). 2 things:
  - Path traversal is actually pretty complicated once we get to branching especially when not all the lanes will follow the branch
  - Memory model is not any better, as memory calls get consolidated by LSR, and I need to figure out how to do that

  - Fortunately, I have an idea. I will approach basic instruction traversal first. I will create an instruction cache that will store 64 bytes worth of instructions (or at least a simple assembly program) inside, and the PC just has to retrieve each one send to the IR

- **8/24/26:** A bit of a late follow up, but I want to move path branching and memory retrieval into their own respective folders b/c these details are fairly complicated and require experimentation specific to those. What I have been able to achieve though is a gpu warp that can instructions into its instruction cache and run a simple program.
