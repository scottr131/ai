#!/bin/bash
MODEL="Ornith-1.5"
PARAMS="35B"
QUANT="Q4_K_M"
MMPROJ="mmproj-Ornith-1.5-35B-BF16"

llama-server --model ${MODEL}-${PARAMS}-${QUANT}.gguf --mmproj ${MMPROJ}.gguf --temp 0.6 --top-p 0.95 --jinja $@
