#!/bin/bash
set -u

DURATION=5
PATTERN=""
FAILED_DEMOS=()
PASSED_COUNT=0

# Parse options
while getopts "d:p:h" opt; do
  case $opt in
    d) DURATION="$OPTARG" ;;
    p) PATTERN="$OPTARG" ;;
    h)
      echo "Usage: $0 [-d duration_in_seconds] [-p pattern_substring]"
      echo "Example: $0 -d 3 -p GPU"
      exit 0
      ;;
    \?) exit 1 ;;
  esac
done

# Auto-detect VM and Image: local vs smalltalkCI
if [[ -z "${VM:-}" ]]; then
  if [[ -n "${SMALLTALK_CI_VM:-}" ]]; then
    VM="$SMALLTALK_CI_VM"
  elif [[ -f "$HOME/.smalltalkCI/env_vars" ]]; then
    source "$HOME/.smalltalkCI/env_vars"
    VM="${SMALLTALK_CI_VM:-}"
  elif [[ -x "./pharo" ]]; then
    VM="./pharo"
  else
    echo "Error: Could not locate Pharo VM launcher."
    exit 1
  fi
fi

if [[ -z "${IMAGE:-}" ]]; then
  if [[ -n "${SMALLTALK_CI_IMAGE:-}" ]]; then
    IMAGE="$SMALLTALK_CI_IMAGE"
  elif [[ -f "Pharo.image" ]]; then
    IMAGE="Pharo.image"
  else
    echo "Error: Could not locate Pharo image."
    exit 1
  fi
fi

echo "Using VM:    $VM"
echo "Using Image: $IMAGE"
echo "Duration:    ${DURATION}s"

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
  echo "=== Smoke testing: $demo (${DURATION}s) ==="
  echo "=========================================="
  
  if "$VM" "$IMAGE" eval "$demo new runForSeconds: $DURATION"; then
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
