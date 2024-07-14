#!/bin/bash
# Running an Apache Server

# Check if the software is installed and if not install it
if [ "$(which apache2)" == "" ]; then
    sudo apt update
    sudo apt install apache2
fi

# Start the apache server
sudo service apache2 start

# View the homepage running on your computer
open http://localhost

# Stop the apache server
sudo service apache2 stop
