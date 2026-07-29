#!/bin/bash
MODEL="Laguna-S-2.1-MXFP4_MOE-00001-of-00003"
MODEL_DRAFT="laguna-s-2.1-DFlash-BF16"

llama-server --model ${MODEL}.gguf $@

# If using llama.cpp with DFlash speculative decoding:
# llama-server --model ${MODEL}.gguf --model-draft ${MODEL_DRAFT}.gguf --spec-type draft-dflash --spec-draft-n-max 15 -fa on $@
