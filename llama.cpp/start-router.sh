#!/bin/bash

if [[ "$1" =~ ^[0-9]$ ]]; then
    NODE=$1
    shift
    echo "Running on NUMA node: $NODE"
    numactl --cpunodebind="$NODE" --membind="$NODE" llama-server --models-preset ./models.ini $@
else
    echo "Running without numactl..."
    llama-server --models-preset ./models.ini $@
fi
