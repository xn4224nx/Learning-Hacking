#!/bin/python3
# Interact with the operating system in Python

import sys
import os
from pathlib import Path

if len(sys.argv) == 2:
    filepath = Path(sys.argv[1])

    # Determine its type
    print(f'\nFile: "{filepath.name}"\n\t[+] object: ', end="")
    if filepath.is_file():
        print("FILE")
    elif filepath.is_dir():
        print("DIRECTORY")
    else:
        print("DOES NOT EXIST")

    # Determine permissions
    print(f"\t[+] access:", end="")
    read_acc = os.access(filepath, os.R_OK)
    writ_acc = os.access(filepath, os.W_OK)
    exec_acc = os.access(filepath, os.X_OK)

    if read_acc:
        print(" READ", end="")

    if writ_acc:
        print(" WRITE", end="")

    if exec_acc:
        print(" EXECU", end="")

    if not read_acc and not writ_acc and not exec_acc:
        print(" NONE")
    else:
        print()


else:
    print(f"Usage: {sys.argv[0]} your-full-path-here")
