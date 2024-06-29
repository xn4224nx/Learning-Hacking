#!/bin/bash
# Filtering and modifying text files with grep and sed

# Find all cargo commands
echo -e "\nAll Cargo commands:\n"
cat ~/.bash_history | grep ^cargo

# Show the last 6 git commands
echo -e "\nThe last 6 commands:\n"
cat ~/.bash_history | grep ^git | tail -6

# Replace cargo with CARGO value in files
sed s/cargo/CARGO/g ~/.bash_history > ~/.bash_history2

# Show the changed cargo commands
echo -e "\nModified cargo commands:\n"
cat ~/.bash_history2 | grep -i ^CARGO | head -5
rm ~/.bash_history2
