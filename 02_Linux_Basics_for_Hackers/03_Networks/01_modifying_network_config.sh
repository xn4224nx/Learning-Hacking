#!/bin/bash
# Modifying a computers network configuration

last=$(($RANDOM % 255))
new_mac=$(hexdump -n5 -e'/5 "00" 5/1 ":%02X"' /dev/random)

# Change the IP address
echo -e "\nChange the computers IP address to 192.168.178.$last"
sudo ifconfig wlan0 "192.168.178.$last"

# Take the network down
sudo ifconfig wlan0 down

# Spoof Your MAC Address
echo -e "\nChange the MAC address to $new_mac."
sudo ifconfig wlan0 hw ether $new_mac

# Put it backup with the new Mac address
sudo ifconfig wlan0 up
