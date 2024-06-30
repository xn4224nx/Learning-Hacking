#!/bin/bash

# If dig not is not installed by default
# sudo apt install dnsutils

# Find the DNS server serving a website
dig bbc.co.uk

# Collect the nameserver
dig bbc.co.uk ns

# Find the mail exchange servers attached to the domain
dig bbc.co.uk mx

# Show the DNS server used by your computer
echo -e "\nDNS Config file:\n"
cat /etc/resolv.conf

# Show the hosts file
echo -e "\nHosts file:\n"
cat /etc/hosts
