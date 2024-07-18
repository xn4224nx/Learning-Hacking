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
mysql -u root -p'\n' < ./sql_queries/all_user_details.sql > ./results.txt

# Run a command to show the databases to stdout
echo -e "\nDatabases:\n"
mysql -u root -p'\n' -Bse "show databases;"

echo -e "\nTables in information schema:\n"
mysql -u root -p'\n' -Bse "use information_schema; show tables;"

echo -e "\nThe Schema for user_variables :\n"
mysql -u root -p'\n' -Bse "use information_schema; describe COLUMNS;"

echo -e "\nA sample of the table:\n"
mysql -u root -p'\n' "information_schema" -Bse "SELECT * FROM COLUMNS LIMIT 10"

# Stop the service
sudo service mysql stop
