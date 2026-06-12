=== IN-FILE CHANGELOG TEMPLATE ===

Format (one entry per logical change):

- Date | Author | commit: <short-hash> | Short title
- file: <filename>
- details: <full, detailed description of the change; include line ranges, rationale, and any follow-ups>

Example:

2026-06-12 | ajayc | commit: abc123 | Parameterized adder width

- file: fp_adder.v
- details: changed carry logic at lines 120-145; refactored add/sub mux; added parameter WIDTH=32

Notes:

- Keep each entry verbose enough to reconstruct why the change happened and how to revert it.
- Use the `log_change.ps1` helper to prepend entries automatically.
