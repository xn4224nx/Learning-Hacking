#!/bin/bash

# Show the contents of the device directory
echo -e "\nContents of the device directory:\n"
ls -l /dev

# Show partitions of all drives
echo -e "\nThe disk partions on the current computer:\n"
sudo fdisk -l

# List the block devices
echo -e "\nThe disk partions are as follows:\n"
lsblk

