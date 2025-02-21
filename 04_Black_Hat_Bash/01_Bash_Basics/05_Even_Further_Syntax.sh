#!/usr/bin/env bash

# Extract the supplied parameters
SCRIPT_NAME=$0
NUMBER_ARGS=$#
ALL_ARGS=$*
QUOTED_ARGS=$@

echo ${SCRIPT_NAME}
echo ${NUMBER_ARGS}
echo ${ALL_ARGS}
echo ${QUOTED_ARGS}

# Capture user input
echo -e "Enter your name:\t"
read -r name
echo "Hello ${name}!"

# Capture the error code of a command while ignoring the output
lzl &> /dev/null
echo -e "Error code: $?"

# Set an exit code
exit 223
