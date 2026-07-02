# Diagrams

## Purpose

This directory collects diagrams used in research and design: original sketches, refined illustrations, and curated references from external sources. Use this as the single place to find visual resources that document architecture, datapaths, memory hierarchies, and experiment layouts.

## Structure

- `ideas/` — personal diagrams, prototypes, and iterative sketches created during exploration.
- `researched/` — diagrams discovered in literature, vendor docs, and talks (store source attribution alongside the file).

## Conventions

- Filenames: use hyphen-separated, lowercase names and include a short descriptor, e.g. `sm-pipeline.svg`.
- Metadata: add a one-paragraph header into the accompanying Markdown (or the image caption) containing:
  - **Title** — short descriptive title
  - **Source / Author** — URL or name
  - **License** — if available
  - **Tags** — comma-separated keywords (e.g., memory, SM, raster)
- Preferred formats: SVG (editable), PDF (print), PNG (preview), drawio/diagrams files (editable source).

## How to add a diagram

1. Create or export the artwork in an editable format (`.svg`, `.drawio`, `.xd`) and an export (`.png` or `.pdf`) for quick viewing.
2. Place the source file in the appropriate folder (`ideas/` or `researched/`).
3. Place the export in `exports/`
4. Create a short Markdown file with the same base name to record metadata and a short description, e.g. `sm-pipeline.md`:

     - Title: Streaming Multiprocessor Pipeline
     - Source: <https://archive.docs.nvidia.com/>...
     - License: CC-BY or vendor license
     - Notes: One-line summary of what the diagram shows and when to use it.

5. If the diagram came from an external source, include the URL and any required attribution in the Markdown file.

## Tags & Organization

- Use tags to group diagrams by theme (e.g., `memory`, `compute`, `raster`, `profiling`). Add tags in the Markdown metadata for easy searching.

## Examples

- `ideas/sm-pipeline.svg` + `ideas/sm-pipeline.md` — a personal sketch of SM stages and queues.
- `researched/gpu-trace-overview.png` + `researched/gpu-trace-overview.md` — vendor diagram with source link and notes.

## Attribution & Licensing

- Always include the original source URL and license statement for researched diagrams. When in doubt, store the source URL and a short note about reuse restrictions.
