#!/bin/bash

set -e

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
        PHARO_WINDOW_DRIVER=$driver ./pharo-ui Pharo.image eval "OSSDL3GPURenderingBenchmark $bench andThen: [ Smalltalk snapshot: false andQuit: true ] future. #$bench"
    done
done | tee -a results.txt
