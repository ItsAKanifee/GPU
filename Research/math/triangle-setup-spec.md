# Triangle Setup — Module Specification

Status: Draft

Purpose

- Compute triangle coverage predicates and interpolation gradients needed by the rasterizer.

Overview

- Inputs: three vertices in screen space with per-vertex attributes (position (x,y,z,1/w), color, UVs, etc.).
- Outputs: edge function coefficients, bounding box, triangle area (or reciprocal), attribute gradients (dA/dx, dA/dy), and a small descriptor for downstream tiles/fragment stage.

Definitions and conventions

- Coordinate system: screen-space integer or fixed-point pixel coordinates. Use top-left origin (0,0).
- Fill rule: use top-left rule to avoid double-coverage between adjacent triangles.
- Fixed-point format: suggest Q16.8 or Q12.4 depending on target FPGA DSP/BRAM tradeoffs; positions and gradients in signed fixed-point.

Equations

- For vertices v0=(x0,y0), v1=(x1,y1), v2=(x2,y2) compute signed area (2x triangle area):
  $$
  A = (x1-x0)*(y2-y0) - (x2-x0)*(y1-y0)
  $$
- Edge functions (for edge i between vi and vj):
  $$
  E_{ij}(x,y) = (y_i - y_j) * x + (x_j - x_i) * y + x_i*y_j - x_j*y_i
  $$
- A point (x,y) is inside the triangle if all edge functions satisfy the chosen fill rule (>=0 or >0 per top-left convention).
- Attribute interpolation (using barycentric coordinates) can be computed via gradients:
  For attribute a with per-vertex values a0,a1,a2, gradients are:
  $$
  \frac{\partial a}{\partial x} = \frac{(a1-a0)*(y2-y0) - (a2-a0)*(y1-y0)}{A}
  $$
  $$
  \frac{\partial a}{\partial y} = \frac{(a2-a0)*(x1-x0) - (a1-a0)*(x2-x0)}{A}
  $$

Implementation notes (hardware)

- Pipeline stages:
  1) Vertex gather & transform (if needed) — ensure vertices in screen space.
  2) Edge coeffs & area compute (DSPs for multiplies, subtractors).
  3) Bounding box clamp to framebuffer, tile-aligned expansion.
  4) Reciprocal area (fixed-point reciprocal or Newton-Raphson approximation) to produce 1/A for gradient computation.
  5) Compute attribute gradients using precomputed differences and 1/A.
  6) Emit triangle descriptor into a work FIFO: {bbox, edge coeffs, gradients, 1/w data}
- Resource tips:
  - Use DSP slices for cross products and multiplies.
  - Keep attribute width minimal (e.g., 16-bit fixed point) for first pass.
  - Optionally quantize bounding boxes to tile units (e.g., 8x8) to reduce downstream workload.

Numerical stability & edge cases

- Cull degenerate triangles when |A| < epsilon.
- Handle winding consistently; if A < 0, swap vertices or flip tests.
- Avoid divisions in the hot path: compute reciprocal once per triangle, reuse for all attribute gradients.

Top-left fill rule (practical hardware test)

- For each edge, include pixels where edge > 0, and for horizontal edges, include the topmost/leftmost pixel. Implement via adjusted edge constants.

Interfaces

- Input bus (triangle FIFO):
  - Fields: v0,v1,v2 each with x,y, z, 1/w, attributes pointer or inline attributes.
- Output descriptor (to rasterizer or tile-worker):
  - bbox_min_x, bbox_min_y, bbox_max_x, bbox_max_y
  - edge0 (A,B,C), edge1 (A,B,C), edge2 (A,B,C)
  - gradient list per attribute (dA/dx, dA/dy) and a0 at reference pixel
  - triangle ID / flags

Testbench & verification

- Create a CPU reference implementation (double precision) that computes edge functions, coverage and interpolated attributes.
- Generate random triangles (including axis-aligned, thin, and large) and compare per-pixel coverage and attribute values against hardware fixed-point model.
- Unit tests:
  - Area correctness
  - Edge function sign rules (top-left)
  - Gradient consistency (interpolated attribute at vertex matches original)
  - Bounding box clamping and tile alignment

Deliverables for first draft

- This spec file (you are reading it).
- A small reference C/Python test harness to compute expected edge coeffs and gradients.
- A simple RTL skeleton (Verilog/VHDL/SystemVerilog) module interface template for integration.

Next steps (I will start these if you confirm):

- Write the Python reference harness and run a few triangle tests.
- Draft the RTL skeleton and interface in `Host/` or `HDL/` under a new folder `triangle_setup/`.

---
Editor: GitHub Copilot — created 2026-05-30
