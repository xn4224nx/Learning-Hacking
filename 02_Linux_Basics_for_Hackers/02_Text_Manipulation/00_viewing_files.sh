#!/bin/bash
# Viewing Files in Linux

# Print the entire file to screen
echo -e "\nPrint the permissions file:\n"
cat /etc/passwd

# Print the first 20 lines of a file
echo -e "\nPrint the first 20 commands:\n"
head -20 ~/.bash_history

# Print the last 20 lines of a file
echo -e "\nPrint the last 20 commands:\n"
tail -20 ~/.bash_history

# Number of lines when printing to stdout
echo -e "\nAll numbered file mounts:\n"
nl /etc/fstab
