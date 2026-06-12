# Experiment Template

Purpose: provide a reproducible folder layout and in-file changelog conventions for experiments.

Structure

- `README.md` — experiment purpose, hypothesis, quick start.
- `module/` — source files for the experiment (HDL, hosts, scripts).
- `notes.md` — observations, results, references.
- `changelog.md` — optional external changelog for the experiment.
- `changelog_template.md` — format guidance for in-file changelogs.
- `scripts/` — helper scripts (e.g., `log_change.ps1`).

In-file changelog
Place a structured changelog header at the top of each module you edit. Keep full entries (not summaries). Example header block to paste into the top of source files:

```
=== IN-FILE CHANGELOG ===
2026-06-12 | ajayc | commit: abc123 | Added parameterized adder width
- file: fp_adder.v
- details: changed carry logic at lines 120-145; refactored add/sub mux
=== END CHANGELOG ===
```

Why this layout

- Keeps exploratory content separated from main code (`Research/Experiments`).
- Makes every experiment self-contained and reproducible.

How to use the helper script
Use `scripts/log_change.ps1` to prepend a changelog entry to a file. See `changelog_template.md` for entry format. If you want commits to automatically write entries, run the example `post-commit` caller from `scripts/` as a `post-commit` hook.

Example experiment tree

```
Research/Experiments/my-adder-experiment/
  README.md
  module/
    fp_adder.v  (has in-file changelog at top)
  notes.md
  changelog.md
  scripts/
    log_change.ps1
```

Questions or edits: update this template to match project conventions.
