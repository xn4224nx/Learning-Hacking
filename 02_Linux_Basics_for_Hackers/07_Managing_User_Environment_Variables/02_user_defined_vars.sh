#!/bin/bash
# Using user created variables

# Set a user defined variable
MYVAR="data"
echo -e "The variable = '$MYVAR'\n"

# Remove the variable
unset MYVAR
echo -e "The variable = '$MYVAR'\n"
