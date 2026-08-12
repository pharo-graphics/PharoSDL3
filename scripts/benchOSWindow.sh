#!/bin/bash
set -u

# Trap SIGINT / SIGTERM to ensure Ctrl+C aborts the whole script immediately
trap "echo -e '\nInterrupted.'; exit 130" INT TERM

PHARO_EVAL="${1:-./pharo-ui Pharo.image}"

echo "Pharo command: $PHARO_EVAL"

BENCHES=(
    "benchLarge"
    "benchTwoDistant"
    "benchVertical"
)
DRIVERS=(
    "OSSDL2Driver"
    "OSSDL3Driver"
    "OSSDL3GPUDriver"
)

for bench in "${BENCHES[@]}"; do
    for driver in "${DRIVERS[@]}"; do
        echo ""
        echo "# Running $bench with $driver..."
        PHARO_WINDOW_DRIVER=$driver $PHARO_EVAL eval "OSBenchmarkMorph $bench andThen: [ Smalltalk snapshot: false andQuit: true ] future. #$bench"
    done
done
