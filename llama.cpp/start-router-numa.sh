#!/bin/bash
# Use this script in a multi-socket system to prevent the model
# from crossing NUMA node boundaries.

numactl --cpunodebind=$1 --membind=$1 llama-server --models-preset ./models.ini ${@:2}
