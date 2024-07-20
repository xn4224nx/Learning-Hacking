#!/bin/bash
# Basic Wireless commands

# Show the activated network interfaces
echo -e "Network Interfaces:\n"
ifconfig

# Show the Wireless interfaces
echo -e "\nWireless interfaces:\n"
iwconfig

# Show the available wifi networks
echo -e "\nCurrently available WiFi networks:\n"
nmcli -p -w 0 dev wifi
