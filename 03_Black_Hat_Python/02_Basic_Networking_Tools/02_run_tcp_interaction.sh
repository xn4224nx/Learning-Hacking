#!/bin/bash
# Start the TCP server and client and show the communication between them.

# Start up the server
python3 ./01_tcp_server.py &

# Use the client to communicate with the server
for i in {0..4}
do
    sleep 5
    echo -e "\n\nClient Started\n++++++++++++++\n"
    python3 ./00_tcp_client.py
done

