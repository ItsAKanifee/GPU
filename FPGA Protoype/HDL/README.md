# HDL

This folder contains RTL and testbenches for core components of the GPU prototype. It is intended to contain finalized, synthesizable modules and their associated testbenches. For research notes, diagrams, and other references, see the `Research/` and `Diagrams/` folders.

## Structure

- Files are organized by module type and function.
- *Files to be added:* `HDL/cores/` for core modules, `HDL/memory/` for memory modules, `HDL/interfaces/` for interface modules, and `HDL/tb/` for testbenches.

## Quick Usage

1) Simulate with `vcs`

## Notes

- For synthesis and timing runs use Vivado or your preferred FPGA toolchain; keep synthesizable modules in `HDL/` root folders for easier flow.

## Style

- Prefer parameterized modules (`parameter WIDTH = 32`) and small interfaces so components are reusable.
- Place testbenches in `tb/` subfolders and keep them self-contained.

## Next steps

- [ ] Finalize the integer core datapath and ALU modules.
