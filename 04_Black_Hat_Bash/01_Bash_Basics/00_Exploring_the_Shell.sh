#!/bin/bash

# Determine the version of Bash that is present
bash --version

# Show the environmental variables
echo -e "\nEnvironmental Variables:\n"
env

# Print specific environmental variables
echo -e "\nSHELL = '${SHELL}'"
echo -e "\nThe Version of Bash = '${BASH_VERSION}'"
echo -e "\nPID of the Bash Process = '${BASHPID}'"
echo -e "\nUsers Assigned Groups = '${GROUPS}'"
echo -e "\nThe Current Hostname = '${HOSTNAME}'"
echo -e "\nOperating System Type = '${OSTYPE}'"
echo -e "\nCurrent Working Directory = '${PWD}'"
echo -e "\nA Random Unsigned Number = '${RANDOM}'"
echo -e "\nThe Current User ID = '${UID}'"
echo -e "\nFull Shell Path = '${SHELL}'"
