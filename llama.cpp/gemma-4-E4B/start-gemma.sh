#!/bin/bash
MODEL="gemma-4"
PARAMS="E4B"
TUNE="it"
SUFFIX="qat-UD"
QUANT="Q4_K"
DEPTH="XL"
MMPROJ="mmproj-F16"

llama-server --model ${MODEL}-${PARAMS}-${TUNE}-${SUFFIX}-${QUANT}_${DEPTH}.gguf --mmproj ${MMPROJ}.gguf --model-draft mtp-${MODEL}-${PARAMS}-${TUNE}.gguf --temp 1.0 --top-p 0.95 --top-k 64 --spec-type draft-mtp --spec-draft-n-max 2 $@
