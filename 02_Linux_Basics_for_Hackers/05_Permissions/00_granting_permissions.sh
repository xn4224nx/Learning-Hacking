#!/bin/bash
# Granting file and folder permissions

# Grant Ownership of a file
touch tmp.txt
sudo chown root tmp.txt

# Create a group
sudo groupadd -f security

# Grant Ownership of a file to a group
sudo chgrp security ./tmp.txt

sudo chown fakename tmp.txt
rm -f tmp.txt

# Delete a group
sudo groupdel security
