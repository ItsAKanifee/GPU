# FPGA Prototype

## Overview
This folder contains the starting point for designing my own GPU. Here, I will document research, ideas, and the prototyping plan for implementing a basic GPU structure on an FPGA Boolean Board.

## Goal
- Design a Graphics GPU and implement it in SystemVerilog
- *Specs*:
    - Render a still image at 1080p resolution

## Prototyping Plan

1. **Research & Requirements Gathering**
    - Study basic GPU architecture and open-source GPU projects
    - Identify minimal feature set for first prototype (e.g., framebuffer, rasterizer)

2. **Development Environment Setup**
    - Set up FPGA toolchain (e.g., Quartus, Vivado, or relevant tools)
    - Prepare SystemVerilog simulation environment

3. **Module Design & Implementation**
    - Design and implement core modules:
        - Framebuffer (memory for storing pixel data)
        - Simple rasterizer (draw basic shapes or patterns)
        - VGA/HDMI output (for image display)

4. **Integration & Testing**
    - Integrate modules and test in simulation
    - Synthesize and deploy to FPGA board
    - Debug and iterate on hardware

5. **Milestones**
    - [ ] Display a solid color on screen
    - [ ] Display a test pattern (e.g., color bars)
    - [ ] Render a static 1080p image from memory
    - [ ] Add basic drawing primitives (lines, rectangles)

6. **Documentation & Next Steps**
    - Document design decisions and results
    - Plan for additional features (e.g., simple shaders, input handling)

---

*This plan will be updated as progress is made and new challenges are encountered.*