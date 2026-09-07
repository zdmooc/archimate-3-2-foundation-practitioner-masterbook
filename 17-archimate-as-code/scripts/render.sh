#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MODELS="$ROOT/17-archimate-as-code/models"
OUT="$ROOT/17-archimate-as-code/generated"
IMAGE="plantuml/plantuml:1.2026.7"

mkdir -p "$OUT"
rm -f "$OUT"/*.svg

printf 'Rendering ArchiMate PlantUML views with %s\n' "$IMAGE"

count=0
while IFS= read -r -d '' file; do
  base="$(basename "${file%.puml}")"
  docker run --rm -i "$IMAGE" -tsvg -pipe < "$file" > "$OUT/$base.svg"
  count=$((count + 1))
done < <(find "$MODELS" -type f -name '*.puml' -print0 | sort -z)

printf 'Generated %s SVG diagram(s) in %s\n' "$count" "$OUT"
