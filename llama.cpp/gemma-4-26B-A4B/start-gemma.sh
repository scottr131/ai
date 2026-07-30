#!/bin/bash
MODEL="gemma-4"
PARAMS="26B-A4B"
TUNE="it"
SUFFIX="qat-UD"
QUANT="Q4_K"
DEPTH="XL"
MMPROJ="mmproj-F16"

LLAMA_ARGS=(
	--model ${MODEL}-${PARAMS}-${TUNE}-${SUFFIX}-${QUANT}_${DEPTH}.gguf
	--mmproj ${MMPROJ}.gguf
	--model-draft mtp-${MODEL}-${PARAMS}-${TUNE}.gguf
	--temp 1.0
	--top-p 0.95
	--top-k 64
	--spec-type draft-mtp
	--spec-draft-n-max 2
)

if [[ "$1" =~ ^[0-9]$ ]]; then
    NODE=$1
    shift
    echo "Running on NUMA node: $NODE"
    numactl --cpunodebind="$NODE" --membind="$NODE" llama-server "${LLAMA_ARGS[@]}" "$@"
else
    echo "Running without numactl..."
    llama-server "${LLAMA_ARGS[@]}" "$@"
fi
