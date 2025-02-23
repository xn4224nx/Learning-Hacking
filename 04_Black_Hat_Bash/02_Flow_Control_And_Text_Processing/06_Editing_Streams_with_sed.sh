#!/usr/bin/env bash

log_file="../00_Data/log.txt"

# Load the file and replace every instance of Mozilla with Godzilla then save
sed 's/Mozilla/Godzilla/g' ${log_file} > "tempfile0.txt"

# Remove the whitespace from the file
sed 's/ //g' ${log_file} > "tempfile1.txt"

# Delete the first line of the file
sed '1d' ${log_file} > "tempfile2.txt"

# Delete the 5th and 7th lines of the file
sed '5,7d' ${log_file} > "tempfile3.txt"

# Print the lines of the file
sed -n '2,15 p' ${log_file}

# Modify the file inplace with -i
sed -i '1d' "tempfile3.txt"

# Cleanup the created text files
find . -name '*.txt' -delete
