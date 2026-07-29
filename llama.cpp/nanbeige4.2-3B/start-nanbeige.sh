#!/bin/bash
MODEL="Nanbeige4.2"
PARAMS="3B"
QUANT="Q4_K"
DEPTH="M"

llama-server --model ${MODEL}-${PARAMS}-${QUANT}_${DEPTH}.gguf $@
