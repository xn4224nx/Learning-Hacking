#!/bin/bash

# Listing files with details
ls -l

# Listing all files with details
ls -al
ls -a -l

# Showing help and documentation
ls --help

# Create a directory
mkdir tmp_dir0

# Create multiple directories
mkdir tmp_dir1 tmp_dir2

# delete the directories
rm -r tmp_dir0 tmp_dir1 tmp_dir2

# Show all running processes and do a full format listing
ps -e -f

# Show available disk space
df --human-readable
