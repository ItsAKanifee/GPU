# 🖥️ FPGA GPU Project  
*A minimal, custom graphics pipeline implemented on a Xilinx Spartan‑7 FPGA.*

## 📌 Overview  
This project implements a **simple, fixed‑function GPU** on an FPGA.  
The goal is to design and build a working graphics pipeline capable of:

- Rasterizing triangles  
- Interpolating vertex attributes  
- Running a minimal fragment shader  
- Writing pixels to a framebuffer  
- Outputting video over HDMI  

The architecture is intentionally small and educational — inspired by early GPUs and modern FPGA‑friendly designs.

---

## 🎯 Project Goals  
- Understand GPU architecture at a hardware level  
- Implement a full graphics pipeline in SystemVerilog  
- Explore rasterization math (edge functions, barycentric coordinates)  
- Build a working framebuffer + HDMI output  
- Create a command interface for host‑driven rendering  
- Document the entire process for reproducibility and learning  

---

## 🧱 Repository Structure  

gpu-project/
│
├── README.md
├── Overview/
├── Research/
├── FPGA Prototype/
├── Design/
├── Diagrams/
├── HDL/
├── Experiments/
├── Host/
└── Docs/


### **Overview/**  
High‑level descriptions of the project, goals, and terminology.

### **Research/**  
Notes on GPU architecture, rasterization math, FPGA constraints, and fixed‑point formats.

### **FPGA Prototype/** 
Implementation of a basic GPU using System Verilog to be implemented on a Spartan 7 Board

### **Design/**  
Module‑level specifications for the command processor, rasterizer, shader, framebuffer, and HDMI controller.

### **Diagrams/**  
Block diagrams, flowcharts, and memory maps (Draw.io or Excalidraw).

### **HDL/**  
SystemVerilog source code, testbenches, and board constraints.

### **Experiments/**  
Rendering tests, performance measurements, debug logs, and incremental results.

### **Host/**  
UART protocol, command formats, and Python scripts for sending draw commands.

### **Docs/**  
Final report, presentation notes, and milestone tracking.

---

## 🧩 Architecture Summary  

The GPU consists of the following major components:

### **1. Command Processor**  
Receives draw commands from a host (UART or soft CPU) and dispatches triangles to the rasterizer.

### **2. Triangle Setup Unit**  
Computes bounding boxes and edge function coefficients.

### **3. Rasterizer**  
Iterates over pixels, evaluates edge functions, and generates fragments.

### **4. Fragment Shader**  
A minimal pipeline supporting:  
- Flat color  
- Interpolated color  
- Optional texture lookup (BRAM‑backed)

### **5. Framebuffer**  
BRAM‑based dual‑port memory storing RGB565 pixels.

### **6. HDMI Output**  
Reads the framebuffer and generates video timing signals.

---

## 🧮 Math Used  
- Edge functions for inside‑triangle testing  
- Barycentric coordinates for interpolation  
- Fixed‑point arithmetic for all geometry and shading  
- Address mapping for framebuffer writes  

All derivations live in `research/math/`.

---

## 🧪 Current Status  
- [ ] HDMI output stable  
- [ ] Framebuffer write path implemented  
- [ ] Command interface working  
- [ ] Single‑triangle rasterizer  
- [ ] Attribute interpolation  
- [ ] Texture support  
- [ ] Performance tuning  
- [ ] Final documentation  

---

## 🚀 Getting Started  

### **Prerequisites**
- Xilinx Vivado  
- Boolean Board (Spartan‑7)  
- Python 3 (for host scripts)  
- USB‑UART cable  

### **Build Instructions**
1. Open Vivado  
2. Import the `hdl/` directory  
3. Apply the board constraints from `hdl/constraints/`  
4. Synthesize, implement, and generate bitstream  
5. Program the FPGA  
6. Use `host/send-triangle.py` to draw test triangles  

---

## 📚 Learning Resources  
This project is informed by research into GPU architecture, including:

- GPU Demystified — *Introduction to GPU Architectures and Programming*  
- Medium — *Understanding GPU Architecture: Basics and Key Concepts*  
- Stanford CS149 / CMU 15‑418 — GPU architecture lectures  
- Open‑source FPGA GPU experiments  

(Your `research/` folder contains detailed notes.)

---

## 🧭 Roadmap  
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
MIT License (or whatever you choose).
