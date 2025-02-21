#!/usr/bin/env bash

# Basic Arithmetic
let result_0="7 * 8"
result_1=$((10 % 2))
result_2=$(expr 20 + 534)

echo ${result_0}
echo ${result_1}
echo ${result_2}

# Define an array
num_array=(0 1 2 3 4 5 6)

# Print all the elements of the array
echo ${num_array[*]}

# Print the last element
echo ${num_array[-1]}

# Delete from the array by index
unset num_array[2]
echo ${num_array[*]}

# Change element of the array by index
num_array[0]=-11
echo ${num_array[*]}

# Sends a command to the background so execution imediatly moves onto the next
echo "Sleep for 10 seconds!"
sleep 10 &
echo "Waking up!"

# Only execute the second command if the first one succeeds
mkdir "tmp_dir" && echo "tmp_dir created"
mkdir "tmp_dir" && echo "tmp_dir created again"
rm -r "tmp_dir"

# Run multiple commands regardless of exit status
ls; ps; whoami

# Only run a command if the first fails
lzl || echo "lzl command failed"

# Redirect to a file
echo "Hello world!" > "tmp_file.txt"

# Append to file
echo "Goodbye world!" >> "tmp_file.txt"

cat "tmp_file.txt"

# Redirect the output of one command to another
ls -a / | grep "bin"

# Redirect input to a command
cat < "tmp_file.txt"
rm "tmp_file.txt"
