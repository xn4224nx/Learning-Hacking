#!/bin/bash

readelf -S /bin/ls | grep -E 'plt|got'

# Compile the binary
gcc -o hello_world 04_hello_world.c -m32 -fno-builtin -fno-stack-protector \
-no-pie -fno-pie -mpreferred-stack-boundary=2 -g &> /dev/null

# Open GDB
gdb -q ./hello_world

# Remove the binary
rm ./hello_world

