#!/bin/bash

# Show the file permissions
echo -e "\nFile permissions of the files in the folder:\n"
ls -l

# Dissamble the binary file into assembly
echo -e "\nAssemby breakdown of './00_shellcode'\n"
ndisasm -b 32 ./00_shellcode

