#!/usr/bin/env bash

# Run a command in the background
sleep 100 &

# Verify that it is running
ps -ef | grep sleep

# Show the running jobs
echo -e "\nRunning Jobs:"
jobs

# Move a job to the foreground
echo -e "\nMoving sleep to the foreground."
fg %1

# Move a job to the background
echo -e "\nMoving sleep to the background."
bg %1

# Run a script in the background even after logging out
#nohup 07_Job_Control.sh &
