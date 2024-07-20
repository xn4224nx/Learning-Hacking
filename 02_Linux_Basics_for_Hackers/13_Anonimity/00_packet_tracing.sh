#!/bin/bash

# Show the path that a packet takes to a website
traceroute bbc.co.uk

# Find the ip address of a website
ip=$(dig www.bbc.co.uk | grep -o -m 1 '[0-9]\+[.][0-9]\+[.][0-9]\+[.][0-9]\+')
echo -e "\nBBC ip address is '$ip'\n"

# Stealth scan an IP address
proxychains nmap -sT -Pn $ip
