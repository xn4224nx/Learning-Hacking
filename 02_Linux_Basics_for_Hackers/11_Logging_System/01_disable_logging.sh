#!/bin/bash
# Disabling All Logging

# Restart it
sudo service rsyslog restart

# Stop it all
sudo service rsyslog stop

# Start it all back up again
sudo service rsyslog start
