#!/bin/bash

# Compile the code
gcc -g -o 00_activity_code 00_activity_code.c

# Run the gnu debugger
gdb -q 00_activity_code

# Delete the compiled file
rm ./00_activity_code

