#!/usr/bin/env bash
set -euo pipefail

# run_vivado.sh
# Template wrapper to build and run a SystemVerilog simulation with Vivado/XSim.
# Usage: run_vivado.sh <workdir> <top_module> [--wave]
#   workdir: path containing `module/` and optional `tb/` directories
#   top_module: top-level testbench/module name used by `xelab`
#   --wave: optional flag to produce a waveform `.wdb` file

WORKDIR=${1:-.}
TOP=${2:-}
WAVE=false

if [[ $# -ge 3 && "$3" == "--wave" ]]; then
  WAVE=true
fi

if [[ -z "$TOP" ]]; then
  echo "Usage: $0 <workdir> <top_module> [--wave]" >&2
  exit 2
fi

cd "$WORKDIR"

OUTDIR=output
mkdir -p "$OUTDIR"

# Source Vivado environment if available (adjust path if necessary)
if [[ -f "/opt/Xilinx/Vivado/settings64.sh" ]]; then
  # non-interactive shells may need full path; try to find the versioned path first
  . /opt/Xilinx/Vivado/settings64.sh || true
fi

echo "Compiling SystemVerilog sources..."
# collect sv files from module/ and tb/ if present
SV_SOURCES=()
if [[ -d module ]]; then
  SV_SOURCES+=(module/*)
fi
if [[ -d tb ]]; then
  SV_SOURCES+=(tb/*)
fi

# Use xvlog to compile (SystemVerilog)
xvlog --sv ${SV_SOURCES[@]} 2>&1 | tee "$OUTDIR/xvlog.log"

echo "Elaborating top module: $TOP"
xelab -debug typical "$TOP" -s sim_snapshot 2>&1 | tee "$OUTDIR/xelab.log"

echo "Running simulation (xsim)"
if $WAVE; then
  xsim sim_snapshot -wdb "$OUTDIR/wave.wdb" -R 2>&1 | tee "$OUTDIR/xsim.log"
else
  xsim sim_snapshot -R 2>&1 | tee "$OUTDIR/xsim.log"
fi

echo "Simulation finished. Logs and artifacts in $WORKDIR/$OUTDIR"
