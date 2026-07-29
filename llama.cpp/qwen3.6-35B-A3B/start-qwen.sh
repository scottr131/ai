#!/bin/bash
MODEL="Qwen3.6"
PARAMS="35B-A3B"
QUANT="MXFP4_MOE"
MMPROJ="mmproj-F16"

llama-server --model ${MODEL}-${PARAMS}-${QUANT}.gguf --mmproj ${MMPROJ}.gguf --temp 0.7 --top-p 0.9 --top-k 20 --presence-penalty 1.5 --min-p 0.00 --spec-type draft-mtp --spec-draft-n-max 2 --jinja $@
