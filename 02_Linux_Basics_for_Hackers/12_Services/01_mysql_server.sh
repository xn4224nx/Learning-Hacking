#!/bin/bash
# MySQL Service Operations

sudo apt install mariadb-server mariadb-client 

# Check if the MySQL software is installed and install it if needed
if [ "$(which mysql)" == "" ]; then
    sudo apt update
    sudo apt install mariadb-server mariadb-client 
fi

# Start the service
sudo service mysql start

# Secure the instalation
sudo mysql_secure_installation

# Stop the service
sudo service mysql stop
