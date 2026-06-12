# Experiment Notes

Use this file to record your thought process, design decisions, and detailed change-by-change notes before code is finalized.

Sections

- **Overview**: short summary of experiment goals and hypothesis.

- **Design Thoughts / Brainstorm**:
  - Date | Author — notes about approaches considered, tradeoffs, sketches.

- **Daily Log**:
  - 2026-06-12 | ajayc — Started parameterized adder. Notes: consider carry-save vs ripple for speed/area tradeoff.

- **Change-by-change (pre-commit)**:
  - 2026-06-12 | ajayc | file: module/fp_adder.sv | details: replaced generate-based carry with explicit loop for readability; see in-file changelog header for full context.

- **Experiments / Results**:
  - Test name, configuration, outcome, link to `output/` logs.

- **Next steps / TODOs**:
  - Small, actionable items to progress this experiment.

Guidelines
- Be explicit: include dates, authors, filenames, and rationale for each decision.
- Keep `Change-by-change` entries granular — these can be pasted into in-file changelogs later.
- Link to diffs or commits where possible.
