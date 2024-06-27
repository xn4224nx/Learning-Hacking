#!/bin/bash
# Overview of basic commands in Linux

# Present Working Directory
echo -e "\nCurrent working directory:\n$(pwd)" 

# Determine the user who is logged in 
echo -e "\nCurrent user is '$(whoami)'"

# Move the directory one up
cd ..
echo -e "\nNew directory is:\n$(pwd)"

# Change working directory to root
cd /
echo -e "\nNew directory is:\n$(pwd)"

# Change the working directory to Home 
cd $HOME
echo -e "\nHome directory is:\n$(pwd)"

# List the directory contents
echo -e "\nDir contents:\n$(ls -l)"

# List the hidden dir contents
echo -e "\nHidden dir contents:\n$(ls -l -a)"

# Show help
echo -e "\nShow help:\n\n$(apt -h)"

# Show the manual page
man apt
