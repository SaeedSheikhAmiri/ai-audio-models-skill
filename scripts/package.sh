#!/usr/bin/env bash
# Build the uploadable skill archive for Claude.
set -euo pipefail

cd "$(dirname "$0")/.."
name="ai-audio-models-skill"
mkdir -p dist

# SKILL.md must sit at the archive root, with references/ beside it.
rm -f "dist/${name}.zip"
zip -r "dist/${name}.zip" SKILL.md references \
  -x '*.DS_Store' -x '__MACOSX/*' >/dev/null

echo "built dist/${name}.zip"
unzip -l "dist/${name}.zip" | tail -n +2
