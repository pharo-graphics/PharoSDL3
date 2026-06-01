#!/bin/bash

set -e

BENCHES=(
    "benchLarge"
    "benchTwoDistant"
    "benchVertical"
)

for bench in "${BENCHES[@]}"; do
    PHARO_WINDOW_DRIVER=OSSDL2Driver ./pharo-ui Pharo.image eval "OSSDL3GPURenderingBenchmark $bench andThen: [ Smalltalk snapshot: false andQuit: true ] future. #$bench"
    PHARO_WINDOW_DRIVER=OSSDL3Driver PHARO_WINDOW_RENDERER=OSSDL3FormRenderer ./pharo-ui Pharo.image eval "OSSDL3GPURenderingBenchmark $bench andThen: [ Smalltalk snapshot: false andQuit: true ] future. #$bench"
    PHARO_WINDOW_DRIVER=OSSDL3Driver PHARO_WINDOW_RENDERER=OSSDL3GPUFormRenderer ./pharo-ui Pharo.image eval "OSSDL3GPURenderingBenchmark $bench andThen: [ Smalltalk snapshot: false andQuit: true ] future. #$bench"
done | tee -a results.txt
