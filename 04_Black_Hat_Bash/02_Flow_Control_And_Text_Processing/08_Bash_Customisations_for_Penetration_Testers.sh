#!/usr/bin/env bash

# Show all the folders in PATH
echo -e "Folders in PATH:\n\n${PATH}"

# Create an alias to a commonly used command
alias quicknmap="nmap -vv -T4 -p- -sV -max-retries 5 localhost"

# Use the alias (will not work within the script)
quicknmap

# Capture all session activity
FILENAME=$(date +%Y_%m_%d_%H:%M:%S).log

# If the sessions directory doesn't exist, create it.
if [[ ! -d ~/.sessions ]]; then
    mkdir ~/.sessions
fi

# Start recording a script session
if [[ -z $SCRIPT ]]; then
    export SCRIPT="~/.sessions/${FILENAME}"
    script -q -f "${SCRIPT}"
fi
