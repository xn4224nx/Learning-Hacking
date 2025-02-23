#!/usr/bin/env bash

log_file="../00_Data/log.txt"

# Show lines in the file that contain 35.237.4.214
echo -e "One notable IP Address:\n"
grep "35.237.4.214" ${log_file}

# Show lines that contain either of the IP addresses
echo -e "\nTwo notable IP Address:\n"
grep "35.237.4.214\|13.66.139.0" ${log_file}

# Pipe the output of a command to grep, -i means case insensitive
echo -e "\nBash files in the home directory:"
ls -a ~ | grep -i "bash"

# Only return the match, not the full line
echo -e "\nNumbers in the Log:\n"
grep -E -o "\-?[0-9]+" ${log_file}

# Use awk to extract the IP addresses
echo -e "\nIP Addresses in the Log:\n"
awk '{print $1}' ${log_file}

# Print the first and last fields of each line
awk '{print $1,$NF}' ${log_file}

# Find a line with grep and then split it with awk
grep "42.236.10.117" ${log_file} | awk '{print $7}'
