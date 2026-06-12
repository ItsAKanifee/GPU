# Understanding GPU Architecture

## Source

<https://www.scalecomputing.com/resources/understanding-gpu-architecture>

## Notes on the Scale Computing article

- Summary: Vendor-oriented overview of GPU building blocks and their roles — Streaming Multiprocessors (SMs), execution cores, memory hierarchy (registers, L1, L2, HBM), and the interconnect that ties them together.
- Key takeaways:
  - GPUs expose massive parallelism via SIMT warps/wavefronts; latency is hidden through many active threads.
  - Memory bandwidth and cache architecture are primary performance drivers; coalesced accesses and cache locality are emphasized.
  - SM organization and lightweight threading influence scheduling and resource allocation decisions.
- Diagrams: Clear SM and memory-hierarchy diagrams are useful for slides and architecture notes; consider exporting for `Diagrams/`.
- Relevance to our work: Complements academic/course sources (ENCCS, GPU Demystified) with practical vendor-oriented perspective — useful when estimating bandwidth and cache tradeoffs for FPGA/Host mappings.
- Actionable follow-ups:
  - Extract/annotate the SM and memory diagrams into `Diagrams/` with attribution.
  - Add a short comparison table in `architecture-summary.md` contrasting Scale Computing claims with ENCCS and academic papers.
