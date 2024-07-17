#!/bin/bash
# MySQL Service Operations

# Check if the MySQL software is installed and install it if needed
if [ "$(which mysql)" == "" ]; then
    sudo apt update
    sudo apt install mariadb-server mariadb-client 
fi

# Start the service
sudo service mysql start

# Secure the instalation
# sudo mysql_secure_installation

# Run a SQL script on the database
mysql -u root -p'' < ./sql_queries/all_user_details.sql > ./results.txt

# Stop the service
sudo service mysql stop
