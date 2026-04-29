# 🖥️ GPU Project  
*A minimal, custom graphics pipeline implemented in a 525 tapeout.*

## 📌 Overview  
This project implements a **simple, fixed‑function GPU architecture** on an FPGA as an early prototype for a future **custom silicon (ASIC) tapeout**.  
The FPGA serves as a rapid‑iteration platform to explore:

- Graphics pipeline architecture  
- Rasterization algorithms  
- Memory subsystem behavior  
- Fixed‑point arithmetic choices  
- Module boundaries and timing characteristics  

The long‑term vision is to evolve this design into a **synthesizable, timing‑clean, ASIC‑ready GPU microarchitecture** suitable for fabrication.

---

## 🎯 Project Goals  
### **Short‑term (FPGA prototype)**
- Validate the core graphics pipeline on real hardware  
- Characterize performance, area usage, and timing on FPGA  
- Explore architectural tradeoffs (parallelism, precision, memory layout)  
- Build a functional reference implementation for simulation and verification  

### **Long‑term (ASIC tapeout path)**
- Define a clean, modular, synthesizable GPU architecture  
- Develop ASIC‑friendly RTL with clear timing boundaries  
- Establish a memory hierarchy suitable for silicon (SRAM macros, caches, FIFOs)  
- Prepare for physical design: clocking, floorplanning, and power domains  
- Produce documentation and test infrastructure required for tapeout  

---

## 🧱 Repository Structure  

gpu-project/
-  README.md
- Overview/
- Research/
- FPGA Prototype/
- Design/
- Diagrams/
- HDL/
- Experiments/
- Host/
- Docs/


### **Overview**  
High‑level descriptions of the project, goals, and terminology.

### **Research**  
Notes on GPU architecture, rasterization math, FPGA constraints, and fixed‑point formats.

### **FPGA Prototype** 
Implementation of a basic GPU using System Verilog to be implemented on a Spartan 7 Board

### **Design**  
Module‑level specifications for the command processor, rasterizer, shader, framebuffer, and HDMI controller.

### **Diagrams**  
Block diagrams, flowcharts, and memory maps (Draw.io or Excalidraw).

### **HDL**  
SystemVerilog source code, testbenches, and board constraints.

### **Experiments**  
Rendering tests, performance measurements, debug logs, and incremental results.

### **Host**  
UART protocol, command formats, and Python scripts for sending draw commands.

### **Docs**  
Final report, presentation notes, and milestone tracking.

---

## 🧩 Architecture Summary  

The GPU consists of the following major components:

### *Following Will Be Updated Upon Further Progress*

---

## 🧮 Math Used  
- Edge functions for inside‑triangle testing  
- Barycentric coordinates for interpolation  
- Fixed‑point arithmetic for all geometry and shading  
- Address mapping for framebuffer writes  
- Matrix Multiplication

All derivations live in `research/math/`.

---

## 🧪 Current Status  
- [ ] Research What Makes a GPU 

---

## 🚀 Getting Started  

### **Prerequisites**
- Xilinx Vivado  
- Boolean Board (Spartan‑7)  
- Python 3 (for host scripts)  
- USB‑UART cable  

### **Build Instructions**
-- *To Be Added Further Along Project*

---

## 📚 Learning Resources  
This project is informed by research into GPU architecture, including:

- GPU Demystified — *Introduction to GPU Architectures and Programming*  
- Medium — *Understanding GPU Architecture: Basics and Key Concepts* 
- Branch Education — *How do Graphics Cards Work? Exploring GPU Architecture* 
- Stanford CS149 / CMU 15‑418 — GPU architecture lectures  
- Open‑source FPGA GPU experiments 


---

## 🧭 Roadmap  
- Research Workings of GPU
    - Understand design, architecture limitations, components, etc
- Create A System For Basic Matrix Multiplication
- Add Z‑buffer  
- Add texture sampling  
- Add simple shading models  
- Add parallel fragment pipelines  
- Explore compute‑style SIMD cores  

---

## 🤝 Contributing  
This is a research and learning project. Contributions, suggestions, and discussions are welcome.

---

## 📄 License  
MIT License 
