#!/bin/bash

# Compile the script
echo "gcc -o 00_hello 00_hello.c"
gcc -o 00_hello 00_hello.c &> /dev/null

# Create the object dump in assembly
echo "objdump -d 00_hello > 01_hello_obj_dump.txt"
objdump -d 00_hello > 01_hello_obj_dump.txt

# Delete the compile file
echo "rm ./00_hello"
rm ./00_hello

