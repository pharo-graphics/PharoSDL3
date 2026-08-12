#!/bin/bash
set -u

VM="${1:-./pharo}"
IMAGE="${2:-Pharo.image}"
PATTERN="${3:-}"

FAILED_DEMOS=()
PASSED_COUNT=0

echo "Using VM:    $VM"
echo "Using Image: $IMAGE"

DEMO_QUERY="(' ' join: ((SDL3App allSubclasses reject: #isAbstract) collect: #name)) displayString"
if [[ -n "$PATTERN" ]]; then
  DEMO_QUERY="(' ' join: (((SDL3App allSubclasses reject: #isAbstract) select: [ :each | '*${PATTERN}*' match: each name ]) collect: #name)) displayString"
fi

DEMOS=$("$VM" "$IMAGE" eval "$DEMO_QUERY" | tr -d "'")

if [[ -z "$DEMOS" ]]; then
  echo "No matching demos found."
  exit 0
fi

for demo in $DEMOS; do
  [ -z "$demo" ] && continue
  echo ""
  echo "=========================================="
  echo "=== Smoke testing: $demo (5s) ==="
  echo "=========================================="
  
  if "$VM" "$IMAGE" eval "$demo new runForSeconds: 5"; then
    PASSED_COUNT=$((PASSED_COUNT + 1))
  else
    echo ">>> FAILED: $demo"
    FAILED_DEMOS+=("$demo")
  fi
done

echo ""
echo "=========================================="
echo "          SMOKE TEST SUMMARY              "
echo "=========================================="
echo "Passed: ${PASSED_COUNT}"
echo "Failed: ${#FAILED_DEMOS[@]}"

if [ ${#FAILED_DEMOS[@]} -gt 0 ]; then
  echo ""
  echo "The following demo(s) failed:"
  for failed in "${FAILED_DEMOS[@]}"; do
    echo "  - $failed"
  done
  exit 1
else
  echo ""
  echo "All demos passed successfully!"
  exit 0
fi
