#!/usr/bin/env zsh
set -euo pipefail

# Example post-commit hook caller — place in .git/hooks/post-commit or call from your hook manager.

# Get latest commit short hash
hash=$(git rev-parse --short HEAD)

# List files in this commit
files=($(git diff-tree --no-commit-id --name-only -r $hash))

script_dir="$(dirname "$0")"

for f in ${files[@]}; do
  if [[ -f "$f" ]]; then
    echo "Adding changelog entry to $f"
    "$script_dir/log_change.zsh" "$f" "Auto: commit $hash" "$USER" "$hash"
  fi
done
