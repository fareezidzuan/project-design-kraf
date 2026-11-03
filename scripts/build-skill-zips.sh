#!/usr/bin/env bash
# Build one ZIP per skill, plus one plugin ZIP with every skill, for people
# who install by upload (Claude desktop and web apps, Cowork) instead of the
# Claude Code plugin command.
#   <skill>.zip                    upload as a skill (one folder, SKILL.md inside)
#   project-design-kraf-plugin.zip upload as a plugin (all five skills)
# Every ZIP carries LICENSE, NOTICE.md and licenses/ (Apache 2.0 attribution).
#
# Usage: scripts/build-skill-zips.sh [out-dir]   (default: dist)
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-dist}"
case "$out" in /*) ;; *) out="$root/$out" ;; esac
bundle="project-design-kraf-plugin"

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
rm -rf "$out"
mkdir -p "$out" "$stage/$bundle/skills"

add_legal() {
  cp "$root/LICENSE" "$root/NOTICE.md" "$1/"
  cp -R "$root/licenses" "$1/licenses"
}

for dir in "$root"/skills/*/; do
  name="$(basename "$dir")"
  dest="$stage/$name"
  cp -R "$dir" "$dest"
  find "$dest" -name '.DS_Store' -delete
  cp -R "$dest" "$stage/$bundle/skills/$name"
  add_legal "$dest"
  (cd "$stage" && zip -qr "$out/$name.zip" "$name")
  echo "built $name.zip"
done

cp -R "$root/.claude-plugin" "$stage/$bundle/.claude-plugin"
cp "$root/README.md" "$stage/$bundle/"
add_legal "$stage/$bundle"
(cd "$stage/$bundle" && zip -qr "$out/$bundle.zip" .)
echo "built $bundle.zip"
