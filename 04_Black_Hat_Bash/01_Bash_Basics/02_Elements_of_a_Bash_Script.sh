#!/usr/bin/env bash

# The shebang can be modified to modify the script execution:
#   -x  prints all commands to the terminal before there output
#   -r  runs the commands in a restricted bash shell
#   -n  read commands but don't execute them

# Create a file
touch tmp_file.sh

# Give the file permission to execute
chmod u+x tmp_file.sh

# Append text to the file
echo "echo -e \"Hello, world!\n\"" >> tmp_file.sh

# Check for syntax errors
bash -n tmp_file.sh

# Show the commands before executing
bash -x tmp_file.sh

# Run commands in a restricted bash shell
bash -r tmp_file.sh

# Within this script temporarlly show commands
set -x

# Remove the temporary script
rm tmp_file.sh

# Stop showing commands
set +x

echo -e "\nAll temp files removed!\n"
