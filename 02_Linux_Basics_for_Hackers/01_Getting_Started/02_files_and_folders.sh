#!/bin/bash
# Modifying Files & Directories

# Create a directory
mkdir ./tmp
cd ./tmp

# Create a file with echo
echo -e "Random file contents\n...\n..." > echo_file.txt

# Show the file contents
cat echo_file.txt

# Append to file with echo
echo -e "More random data\n---\n---" >> echo_file.txt
cat echo_file.txt

# Create a file with touch
touch empty_file.txt

# Copy a file
cp echo_file.txt copied_file.txt

# Rename or Move a file
mv echo_file.txt moved_file.txt

# Remove a file
rm empty_file.txt

# Remove a folder
cd ..
rm -r ./tmp
