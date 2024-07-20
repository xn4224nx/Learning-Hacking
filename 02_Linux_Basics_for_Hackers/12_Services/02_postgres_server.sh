#!/bin/bash
# Using PostgreSQL

# Check if the PostgreSQL software is installed and install it if needed
if [ "$(which postgresql)" == "" ]; then
    sudo apt update
    sudo apt install postgresql
fi

# Check if Metasploit is installed
if [ "$(which msfconsole)" == "" ]; then
    sudo apt update
    sudo apt install metasploit-framework
if

# Start the service
sudo service postgresql start

# Start Metasploit
msfconsole

# Stop Postgres
sudo service postgresql stop
