#!/bin/bash
# Bluetooth Scanning & Reconnaissance

# Show if the system has access to a bluetooth device
hciconfig

# Find devices that are in discover mode
hcitool scan

# Find infomation about detected devices
hcitool inq

# Ping a device
sudo l2ping 74:C1:4F:74:66:76
