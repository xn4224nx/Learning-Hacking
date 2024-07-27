#!/bin/bash
# Scheduling Tasks

# View the currently scheduled tasks
echo -e "Current crontab file:\n\n"
cat /etc/crontab

# View services that start with the boot
sudo service --status-all

# Show Initalisation Scripts
echo -e "\nStarting scripts:"
ls -l /etc/init.d
