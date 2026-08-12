#!/bin/bash
set -euo pipefail

# On Windows, setup-smalltalkCI does not export SMALLTALK_CI_*
# env vars (see: if (!IS_WINDOWS) in setup-smalltalkCI/dist/index.js).
# Source them from smalltalkCI's env_vars file.
if [[ -z "${SMALLTALK_CI_VM:-}" ]]; then
  source "$HOME/.smalltalkCI/env_vars"
fi

DEMOS=$("$SMALLTALK_CI_VM" "$SMALLTALK_CI_IMAGE" eval \
  "(SDL3App allSubclasses reject: #isAbstract) collect: #name" \
  | sed "s/['\r]//g" | tr -d '#' | tr -d '()' | tr ',' '\n')

for demo in $DEMOS; do
  [ -z "$demo" ] && continue
  echo "=== Smoke testing: $demo ==="
  "$SMALLTALK_CI_VM" "$SMALLTALK_CI_IMAGE" eval "$demo new runForSeconds: 5" \
    || { echo "FAILED: $demo"; exit 1; }
done