#!/usr/bin/env bash
# Install the three GAN harness agents into ~/.claude/agents/
set -euo pipefail

TARGET="${HOME}/.claude/agents"
SRC="$(cd "$(dirname "$0")" && pwd)/agents"

mkdir -p "$TARGET"

for f in gan-planner.md gan-generator.md gan-evaluator.md; do
  if [ -f "$TARGET/$f" ]; then
    echo "  skip: $TARGET/$f already exists (delete it first to reinstall)"
  else
    cp "$SRC/$f" "$TARGET/$f"
    echo "  installed: $TARGET/$f"
  fi
done

echo ""
echo "Done. Verify in Claude Code with /agents or by calling the Agent tool"
echo "with subagent_type: gan-planner | gan-generator | gan-evaluator."
