#!/usr/bin/env bash

# Check if something is a directory
if [ -d "/" ]; then
    echo "'/' is a directory"
fi

# Check if a file is readable
if [ -r "/etc/hosts" ]; then
    echo "hosts file can be read"
fi

# Check if a file is writable
if [ -w ~/.bashrc ]; then
    echo "bashrc can be written to"
fi

# Check if the file can be executed
if [ -x ./00_Test_Operators.sh ]; then
    echo "This file can be executed"
fi

# Check if a file size is greater than zero
if [ -s "/etc/shadow" ]; then
    echo "The password file is larger than zero"
fi
