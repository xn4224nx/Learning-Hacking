#!/bin/bash
# Finding things in Linux

# Finding binaries files
echo -e "\nThe locations of the aircrack-ng binary:\n$(whereis aircrack-ng)"

# Finding Binaries in the Path variable
echo -e "\nThe location of the apt binary in PATH:\n$(which apt)"

# Find apache2 files in root
echo -e "\nFiles called 'sudo':\n"
sudo find / -type f -name sudo

# Find Shell scripts in a particular folder
echo -e "\nShell scripts in the user's home dir:\n"
find $HOME -type f -name '*.sh'

# List running processes
echo -e "\n\nAll running processes:\n"
ps aux

# List processes that contain nop in the name
echo -e "\n\nAll nop processes:\n"
ps aux | grep nop
