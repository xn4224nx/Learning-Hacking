#!/bin/bash

# Remove the extention from the file
asm_file="${1%%.*}"

# Assemble the file as 64bit
nasm -f elf64 $1

# Link the file to resolve the addresses
ld ${asm_file}".o" -o ${asm_file}

# Remove the object file
rm ${asm_file}".o"

# Run the executable file or debug through gnu
[ "$2" == "-g" ] && gdb -q ${asm_file} || ./${asm_file}

# Remove the object file
rm ${asm_file}
