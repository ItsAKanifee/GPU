# Research

## Purpose

This workspace collects the research, notes, and references for our custom GPU project. It centralizes architecture summaries, FPGA prototype planning, numerical references, experiment notes, and consultation logs to guide design, implementation, and teaching.

## Scope

- Architecture: GPU design concepts, SM/warp/memory models, and optimization notes.
- FPGA prototyping: constraints, IPs, RTL sketches, and SystemVerilog notes.
- Experiments: benchmarks, microbench methodology, and measurement results.
- Math & numerics: floating-point references, precision trade-offs, and FLOPS notes.
- Consultations: meeting notes, expert feedback, and AI-assisted research threads.
- Diagrams and reference material: block diagrams, timing sketches, and helpful links.

## How to contribute

- Add or update content as Markdown, keeping text concise and link-heavy for references.
- For new experiments or code, include a short README (what, how, results) in the relevant folder.
- Name files clearly: `topic.short-summary.md` (examples: `Fundamentals.md`, `vector-add-bench.md`).
- When adding external references, include `Source:` with a URL and a one-paragraph summary.
- Use `Research/consultations/` for meeting notes and `Research/consultations/copilot/` for AI-assisted threads.

## Top-level folders (current)

- `overview/` — high-level primers and background documents (GPU basics, course notes).
- `525-preparation/` — materials and checkpoints for the 525 preparation milestone.
- `circuit-design/` — schematic-level notes and analog/digital circuit research.
- `fpga-notes/` — FPGA-focused experiments, toolchain notes, and bitstream considerations.
- `gpu-architecture/` — curated architecture articles and summaries (CUDA, SIMT, SMs).
- `Preliminary/` — short technical notes (FLOPS, math references, quick derivations).
- `Experiments/` — reproducible experiment descriptions and raw results.
- `consultations/` — meeting notes, lists of questions, and expert contacts.

## Recommended workflow

1. Search the `Research/` tree for the topic you need (e.g., memory, SMs, FLOPS).
2. Add findings to the appropriate folder and create a one-paragraph summary at the top of the file.
3. If the change affects design decisions, add a short note under `Experiments/` describing the impact and suggested follow-ups.

## Contacts & references

- Keep a running list of external references in `Research/References.md` 
- Use `Research/consultations/Experts/` to store contact details and discussion logs.

