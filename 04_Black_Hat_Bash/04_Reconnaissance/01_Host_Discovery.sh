#!/usr/bin/env bash

# Ping an ip address or a URL
ping 8.8.8.8 -c 5
ping www.bbc.co.uk  -c 5

# Scan a range of IP addresses
nmap -sn 172.16.10.0/24
nmap -sn 172.16.10.0/24 | grep "Nmap scan" | awk -F'report for ' '{print $2}'

# Scanning on the local network
sudo arp-scan 172.16.10.0/24 -I br_public
