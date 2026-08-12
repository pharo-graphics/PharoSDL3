#!/bin/bash
set -u

# Trap SIGINT / SIGTERM to ensure Ctrl+C aborts the whole script immediately
trap "echo -e '\nInterrupted.'; exit 130" INT TERM

SUBSTRING="${1:-}"
PHARO_EVAL="${2:-./pharo Pharo.image}"

FAILED_DEMOS=()
PASSED_COUNT=0

echo "Pharo command: $PHARO_EVAL"
if [[ -n "$SUBSTRING" ]]; then
  echo "Substring filter: $SUBSTRING"
fi

DEMO_QUERY="' ' join: ((SDL3App allSubclasses reject: #isAbstract) collect: #name thenSelect: [ :each | '*${SUBSTRING}*' match: each ])"

DEMOS=$($PHARO_EVAL eval "$DEMO_QUERY" | tr -d "'")

for demo in $DEMOS; do
  [ -z "$demo" ] && continue
  echo ""
  echo "# Smoke testing: $demo..."
  
  if $PHARO_EVAL eval "$demo new runForSeconds: 5"; then
    PASSED_COUNT=$((PASSED_COUNT + 1))
  else
    echo ">>> FAILED: $demo"
    FAILED_DEMOS+=("$demo")
  fi
done

echo ""
echo "# Smoke Test Summary"
echo "Passed: ${PASSED_COUNT}"
echo "Failed: ${#FAILED_DEMOS[@]}"

if [ ${#FAILED_DEMOS[@]} -gt 0 ]; then
  echo ""
  echo "Failed demos:"
  for failed in "${FAILED_DEMOS[@]}"; do
    echo "  - $failed"
  done
  exit 1
fi
