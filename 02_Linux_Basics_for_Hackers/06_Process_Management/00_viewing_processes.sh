#!/bin/bash
# View Running Processes on a System

# Show the processes started by the current user
echo -e "\nProcesses started by the user:\n"
ps

# Show all processes
echo -e "\nAll processes running:\n"
ps aux

# Filtering a process by name
echo -e "\nFind Firefox processes:\n"
ps aux | grep firefox 

# Show a live version of the running processes ordered by greed
top
