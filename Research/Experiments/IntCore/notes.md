# Int_Core Notes

## Overview

This document is a place where I right down my progress and ideas as I proceed with the project.

## Notes + Log

- **6/11/26:** Created a simple lane that stores data and sends it through an ALU, as well as a warp to test 8 lanes simultaneously
  - TODOs: I need the 8 lanes to communicate with the same cache and output to said cache
  - Ideas:
    - 1. Create a memory block that can read from two entry points (A, B), and write to one (C)
    - 1. Create one bigger block of memory that all lanes can read from

- **6/20/26:** Currently have a late-night stream of conciusness, and realized I should write these thoughts and ideas down before I forget them:

  - 1. The current datapath design I have is a very simplified design of what a true datapath looks like
    - The datapath should have an ISA and be able to follow instructions using a PC
    - The current design is a fancy adder, not a GPU running a process
    - Think back to 240 comp arch, the datapath should run *LD* and *LW* beyond the simple math functions
    - Instead of starting over, try expanding each section bit by bit
      - I.e: I have the basic functionality of the ALU set up, it takes 2 ints and returns one. Now try to get this integer to route to a register or memory
    - Focus on making one lane before I try implementing a multithreaded warp. Do not try to do both of them at the same time, will get complicated fast

  - 2. *Memory Heirarchy*:
    - This is probably the most complicated aspect of the entire project. There's a lot of memory within a GPU, some shared, a lot individual
    - L1 cache is unique to each SM, while L2 is shared within the entire GPU. Bc having 1 SM would nullify the reason to have an L2 Cache, instead I could target implementing multiple SMs
      - Remember: GPU -> SM -> Datapath
    - Each path should also have access to its own registers so that they can store values within the path
    - How the data is going to be transfered within the GPU:
      - Host (CPU) provides data to GPU -> GPU writes data to L2 -> Each SM reads the same data in L2 -> The SM takes the data from L2 and writes to L1 -> L1 is segmented between multiple lanes -> Each lane reads its own distinct portion of L1 and operates on that peice of memory, writing it back to L1
        - Ok I actually have to figure this out, bc I am pretty sure that is not right: How does data travel through a GPU?

  - 3. *Design*
    - Here is my basic High-Level design for the Int-path: `diagrams/ideas/basic_intpath.drawio`
    - Things I added:
      - PC
        - Different GPUs have different designs, but for simplicity, have all lanes share the same PC
      - IR
        - Shared with all other pipelines in the block
    - Take inspiration from CPU datapath, but simplify in aspects
      - Write values from ALU to registers to be used in the program, or to shared memory with other pipelines
    - Just for later, but benchmark GPU using IOPs (Integer Operations per Second)
