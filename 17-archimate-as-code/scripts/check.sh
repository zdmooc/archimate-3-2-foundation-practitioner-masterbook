#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MODELS="$ROOT/17-archimate-as-code/models"
IMAGE="plantuml/plantuml:1.2026.7"

fail=0

while IFS= read -r -d '' file; do
  base="$(basename "$file")"

  if [[ ! "$base" =~ ^(EXEC|BUS|APP|TEC|SEC|OPS|MIG|GREEN)-[0-9]{2}-.*\.puml$ ]]; then
    printf 'Naming violation: %s\n' "$file" >&2
    fail=1
  fi

  grep -q '@startuml' "$file" || { printf 'Missing @startuml: %s\n' "$file" >&2; fail=1; }
  grep -q '@enduml' "$file" || { printf 'Missing @enduml: %s\n' "$file" >&2; fail=1; }
  grep -q '!include <archimate/Archimate>' "$file" || { printf 'Missing ArchiMate include: %s\n' "$file" >&2; fail=1; }
done < <(find "$MODELS" -type f -name '*.puml' -print0)

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

printf 'Repository conventions OK. Checking PlantUML syntax...\n'

docker run --rm \
  -v "$ROOT:/workspace" \
  -w /workspace \
  "$IMAGE" \
  -checkonly -failfast2 "17-archimate-as-code/models/**/*.puml"

printf 'PlantUML syntax OK.\n'
