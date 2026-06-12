#!/usr/bin/env zsh
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <file> <message> [author] [commit]" >&2
  exit 1
fi

file="$1"
message="$2"
author="${3:-$USER}"
commit="${4:-}"

if [[ ! -f "$file" ]]; then
  echo "File not found: $file" >&2
  exit 1
fi

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
commitPart=""
if [[ -n "$commit" ]]; then
  commitPart=" | commit: $commit"
fi

entry_header="=== IN-FILE CHANGELOG ===\n"
entry="$timestamp | $author$commitPart | $message\n- file: $(basename "$file")\n- details:\n\n"

content=$(<"$file")

# Prepend the entry and write back to file
printf "%b" "$entry_header$entry$content" > "$file"

echo "Prepended changelog entry to $file"
