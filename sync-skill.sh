#!/usr/bin/env bash
# Push this repo's SKILL.md + references/ to every consuming project.
#
# THIS REPO IS CANONICAL. Edit here, run this, then commit+push and redeploy:
#   ./sync-skill.sh
#   git push origin main     # -> 4 git hosts + kind 30618 state event
#   nsyte deploy .           # -> Blossom + kind 35128 manifest
#
# Never edit a copy in a consuming project — this overwrites them.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGETS=(
  /home/q4/corkboards
  /home/q4/communicator
  /home/q4/planner
)

# Fail loudly rather than silently syncing a partial set. The master lost its
# SKILL.md once and a `cat`-based hash check reported success anyway.
for f in SKILL.md references; do
  [[ -e "$SRC/$f" ]] || { echo "FATAL: $SRC/$f is missing — refusing to sync" >&2; exit 1; }
done
count=$(find "$SRC/references" -name '*.md' | wc -l)
(( count > 0 )) || { echo "FATAL: no reference files found — refusing to sync" >&2; exit 1; }
echo "source: $SRC  (SKILL.md + $count references)"

for d in "${TARGETS[@]}"; do
  [[ -d "$d" ]] || { echo "  skip     $d (not found)"; continue; }
  install -m644 "$SRC/SKILL.md" "$d/SKILL.md"
  rm -rf "$d/references"
  mkdir -p "$d/references"
  install -m644 "$SRC"/references/*.md "$d/references/"
  echo "  synced   $d"
done

echo
echo "verifying every file byte-for-byte:"
fail=0
for d in "${TARGETS[@]}"; do
  [[ -d "$d" ]] || continue
  bad=0
  cmp -s "$SRC/SKILL.md" "$d/SKILL.md" || { echo "  DIFFERS  $d/SKILL.md"; bad=1; }
  for f in "$SRC"/references/*.md; do
    b=$(basename "$f")
    cmp -s "$f" "$d/references/$b" || { echo "  DIFFERS  $d/references/$b"; bad=1; }
  done
  extra=$(comm -13 <(cd "$SRC/references" && ls) <(cd "$d/references" && ls) || true)
  [[ -z "$extra" ]] || { echo "  STALE FILES in $d/references: $extra"; bad=1; }
  (( bad == 0 )) && echo "  ok       $d" || fail=1
done

echo
if (( fail == 0 )); then
  echo "all targets identical to canonical."
else
  echo "SYNC INCOMPLETE — see DIFFERS/STALE above." >&2
  exit 1
fi
