#!/usr/bin/env bash

# While Loops
loop_idx=0
while [[ loop_idx -lt 10 ]]; do
    loop_idx=$((loop_idx+1))
    echo -e "Loop number ${loop_idx}"
done

# Until Loops - run until the condition is false
until [[ loop_idx -gt 20 ]]; do
    loop_idx=$((loop_idx+1))
    echo -e "Loop number ${loop_idx}"
done

# For operates over a sequence
for list_idx in $(seq 1 10); do
    echo "For Loop Idx: ${list_idx}"
done

# For loop over the ouput of a command
for file in $(ls -a ~); do
    echo "File: '${file}'"
done
