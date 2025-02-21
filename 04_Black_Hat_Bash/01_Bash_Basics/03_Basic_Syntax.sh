#!/usr/bin/env bash

dir_name="tmp_dir"
file_name="tempfile.txt"

# Make a directory
mkdir ${dir_name}

# Create a file within the directory
touch ./${dir_name}/${file_name}

# Show the full contents of the created directory
ls -al ${dir_name}

# Delete the folder and its contents
rm -r ${dir_name}

# Unassign variables
unset file_name
echo "The file name = '${file_name}'"

# Defining a function
print_name(){
    # Define a variable only accessible within this scope
    local name="Hugh Mann"
    echo -e "\nHello ${name}, nice to meet you!"
}

# Use the function
print_name

# local variable cannot be accessed
echo -e "\nHello ${name}, nice to meet you!"
