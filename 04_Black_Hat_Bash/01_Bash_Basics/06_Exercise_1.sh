#!/usr/bin/env bash

out_file="./outfile.txt"
backup_file="./backup.txt"

# Ensure there are two arguments given to the script
if [ $# != 2 ]; then
    echo -e "\nTwo arguments are required!"
    exit 1
fi

# Create an output file and write the current date to file.
date "+%F" > ${out_file}

# Write the full name to file
echo -e "$1 $2" >> ${out_file}

# Make a copy of the outfile
cp ${out_file} ${backup_file}

# Print the output file to the stdout
cat ${out_file}

# Delete the created files
rm ${out_file} ${backup_file}
