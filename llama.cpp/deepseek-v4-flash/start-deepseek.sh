#!/bin/bash
MODEL="DeepSeek-V4-Flash-UD-Q8_K_XL-00001-of-00005"

LLAMA_ARGS=(
        --model ${MODEL}.gguf
        --temp 1.0
        --top-p 1.0
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

