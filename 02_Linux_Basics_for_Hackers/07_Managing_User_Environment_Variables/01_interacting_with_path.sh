#!/bin/bash

# Show what is currently in PATH
echo -e "\nThe PATH variable:\n"
echo $PATH

# Add a dir to PATH
PATH=$PATH:/media
echo -e "\nThe updated PATH variable:\n\n$PATH\n"
