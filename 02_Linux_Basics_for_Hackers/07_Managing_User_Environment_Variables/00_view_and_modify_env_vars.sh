#!/bin/bash
# View and Modifying Environment Variables

# Show the System Enviromental Variables.
echo -e "\nThe system environmental variables:\n"
env

# View all Enviromental Variables.
echo -e "\nView all variables:\n"
set | head -100

# Filtering for particular variables.
echo -e "\nView all variables that mention XDG:\n"
set | grep XDG

# Create a variable or set a currently active one.
MY_TEMP_INT=900
MY_TEMP_STR="A very short string."
echo -e "\nThe temporary variables are:\n\t$MY_TEMP_INT\n\t$MY_TEMP_STR\n"
