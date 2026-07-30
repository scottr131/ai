#!/bin/bash
MODEL="GLM-5.2-UD-IQ1_S-00001-of-00006"

LLAMA_ARGS=(
        --model ${MODEL}.gguf
        --temp 1.0
        --top-p 0.95
        --min-p 0.01
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

