#!/bin/bash
# Using PostgreSQL

# Check if the PostgreSQL software is installed and install it if needed
if [ "$(which postgresql)" == "" ]; then
    sudo apt update
    sudo apt install postgresql
fi

# Start the service
sudo service postgresql start
