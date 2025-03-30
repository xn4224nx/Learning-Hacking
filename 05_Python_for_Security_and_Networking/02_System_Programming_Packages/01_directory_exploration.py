#!/bin/python3
# Navigate around the file system and execute commands

from pathlib import Path
import os

# Get the current working directory
curr_dir = Path.cwd()
print(f'Current directory = "{curr_dir}"')

# Determine the folder above the one above this one.
above_dir = curr_dir.parent.parent
print(f'Above directory = "{above_dir}"')

dir_cnt = 0
file_cnt = 0
othe_cnt = 0
total_bytest = 0

# Iterate over all the files and folders
for entity in above_dir.rglob("*"):
    print(f"{entity.name:<35}", end="\t")

    if entity.is_dir():
        print("d", end="")
        dir_cnt += 1

    elif entity.is_file():
        print("f", end="")
        file_cnt += 1

    else:
        print("u", end="")
        othe_cnt += 1

    print(f" {entity.stat().st_size:>6} bytes")
    total_bytest += entity.stat().st_size

# Summarise the results
print(
    f"\nFILE SURVEY RESULTS"
    f"\n==================="
    f"\n\tFile Count:         {dir_cnt}"
    f"\n\tFolder Count:       {file_cnt}"
    f"\n\tOther Entity Count: {othe_cnt}"
    f"\n\tTotal Size:         {total_bytest}"
)
