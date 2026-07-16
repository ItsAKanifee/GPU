# AMD GPU ISA

## Source

<https://docs.amd.com/v/u/en-US/gcn3-instruction-set-architecture>

## Summary & Notes

*Summary:*

This is the full ISA Document for the GCN3, an older AMD GPU. It goes over the underlying architecture, and provides a clear understanding for programmers to properly work with it. While many features are out of scope of the project due to sheer complexity, there are many takeaways from this document, and it is highly reccomended to read through this to get an understanding for a real working GPU.

*Points:*

This document is really long, so I am listing down some points I think would be important to look at and cite their chapters for reference

*Chapter 1:*

- Chapter 1 Introduces the GPU architecture, and has an image for modern-spec amd design
- Includes 3 Elements (other logic not shown):
  - Data Parallel Processor Array (DPP):
    - Set of compute unit pipelines, operating on independent streams of data (ints or FPs)
      - Each pipeline maintains a seperate interface to memory
    - Can process data
    - Can transfer data to/from memory via memory controller
  - Command Processor:
    - Reads commands the host has written to memory-mapped registers
    - Sends hardware interrupts to host (CPU) when code is complete
  - Memory Controller
    - Has access to all GPU memory and certain system memory allocated by CPU
    - Host cannot write to GPU memory directly

*Chapter 2:*

- Generic Program on GPU:
  - Gather reads on one or more sets of input data
  - Arithmetic Computation
  - Writes one or more sets of data to memory

*Chapter 5:*

- Scalar ALUs operate on the PC as well
- Run 32 bit oeprations 