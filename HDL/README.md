# HDL

This folder contains RTL and testbenches for core experiments (integer and floating-point datapaths). Use this as the canonical place for synthesizable modules, simulation benches, and small verification utilities.

Structure
- `HDL/int_core/` — integer-core RTL and testbenches (modules: `alu.sv`, `datapath.sv`, `tb/datapath_tb.sv`).
- `HDL/<other>/` — add other component folders (e.g., `fp_core/`) for organization.

Quick Usage

1) Simulate with `iverilog` (simple SystemVerilog features only):

```powershell
# from workspace root
cd "HDL/int_core/tb"
iverilog -g2012 -o datapath_tb ../../int_core/datapath.sv ../../int_core/alu.sv datapath_tb.sv
vvp datapath_tb
```

2) Prefer a commercial/SystemVerilog-aware simulator (Questa/ModelSim) for full SV support and waveform debugging:

```powershell
# Questa/ModelSim example
vlib work
vlog -sv ../../int_core/*.sv datapath_tb.sv
vsim -c work.datapath_tb -do "run -all; exit"
```

Notes
- The supplied testbench is a small randomized functional test intended as a starting point. Replace or extend vectors and checkers as needed.
- For synthesis and timing runs use Vivado or your preferred FPGA toolchain; keep synthesizable modules in `HDL/` root folders for easier flow.
- Keep large simulation outputs (VCDs, reports) out of the repo — place them under `FPGA Protoype/results/` and link from experiment notes.

Style
- Prefer parameterized modules (`parameter WIDTH = 32`) and small interfaces so components are reusable.
- Place testbenches in `tb/` subfolders and keep them self-contained.

Next steps
- Add a Python golden model and runner script under `Research/Experiments/IntCore/scripts/` to automate regression runs.
