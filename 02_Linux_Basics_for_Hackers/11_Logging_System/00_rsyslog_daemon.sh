#!/bin/bash
# Using and configuring the RSYSLOG Logging Daemon

# Show the log configuration file
echo -e "\n===============\nLog Config File\n===============\n"
cat /etc/rsyslog.conf

# Show the log rotation configuration file
echo -e "\n======================\nLog Rotate Config File\n======================\n"
cat /etc/logrotate.conf

# Securely delete the log files
shred -f -n 10 /var/log/auth.log.*
