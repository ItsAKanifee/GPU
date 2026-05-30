# Essential Things to Understand

## Conversation Link:
https://copilot.microsoft.com/shares/pages/BYH6RXGfwTZEFJ6aGU7wE


## Detailed Conversation Notes
- Source: Shared Copilot page "Core Components of a GPU" (link above).
- Main topics covered:
	- Streaming Multiprocessors / Compute Units (ALUs, warps/wavefronts, registers, L1/shared memory).
	- Graphics pipeline stages: vertex processing, primitive assembly, triangle setup, rasterizer, fragment shader, output merger/ROPs.
	- Memory hierarchy: registers → L1/shared → L2 → VRAM (for FPGA: BRAM or external SRAM).
	- Command processor / front end responsibilities and minimal implementation for FPGA.
	- Texture units (optional), raster operations, display engine (scanout), scheduler/thread dispatch, interconnect/NoC.
- Key recommendations for an FPGA prototype:
	1. Prioritize hardware stages in this order: triangle setup → rasterizer → fragment shader → framebuffer + scanout → command processor.
	2. Implement a minimal scheduler to feed ALUs and hide memory latency; keep SIMT/SIMD behavior simple for first pass.
	3. Use on‑chip BRAM for framebuffer and small caches; evaluate external SRAM only if BRAM capacity is insufficient.
	4. Defer full-featured texture units and complex filtering until basic pipeline is stable.
	5. Keep ROPs simple (write, optional depth test, basic blending later).
- Action items / follow-ups suggested:
	- Create a module spec for `triangle setup` and `rasterizer` (edge equations, bounding boxes, gradients).
	- Design a minimal `fragment shader` interface (inputs, interpolants, outputs) and testbench.
	- Draft a block diagram for the FPGA prototype showing dataflow, memory, and scanout.
	- Prototype a framebuffer + scanout proof‑of‑concept (BRAM readout → HDMI/VGA timings).
	- Decide memory map: BRAM allocation vs external memory and size estimates.
	- Optionally convert the recommendations into a step-by-step study/implementation plan.
- References cited on the shared page:
	- GPU Architecture Explained: Structure, Layers & Performance — https://www.scalecomputing.com/resources/understanding-gpu-architecture
	- Understanding GPU Architecture: Basics and Key Concepts — https://medium.com/ai-insights-cobet/understanding-gpu-architecture-basics-and-key-concepts-40412432812b
