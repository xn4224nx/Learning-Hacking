#!/usr/bin/env bash
# Record the finding of a new host discovery on the local network

# Key Variables
RECORDED_HOSTS_FILE="seen_hosts.txt"
WAIT_TIME=10
scan_ip_address="192.168.178.0/24"

# Open the records file if it exists and read into a list
if [[ -f ${RECORDED_HOSTS_FILE} ]]; then

    # Read the file into a string and split into an array
    readarray -t seen_objects <<< $(cat "$RECORDED_HOSTS_FILE")

# Otherwise set it as empty
else
    seen_objects=()
fi

# Report about initialisation
echo -e "Known Objects Loaded From Disk = ${#seen_objects[@]}"

