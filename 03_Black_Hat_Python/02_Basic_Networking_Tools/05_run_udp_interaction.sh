#!/bin/bash
# Start the UPD server and client and show the communication between them.
# Thu 15 Aug 15:54:01 BST 2024

# Start up the server
python3 ./04_udp_server.py &

# Use the client to communicate with the server
for i in {0..4}
do
    sleep 5
    echo -e "\n\nClient Started\n++++++++++++++\n"
    python3 ./03_udp_client.py
done
