#!/bin/bash
# Find Computers on the local network

# Find the current computers IP address
ip_address=`hostname -I | cut -d ' ' -f 1`

# Find other computers on the network
nmap -sn $ip_address/24
