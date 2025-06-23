#!/usr/bin/env bash
# Implementing A Simple TCP Server and TCP and Client

echo "Starting TCP Server"
python3 ./08_tcp_server.py &

sleep 1

echo "Starting TCP Client"
python3 ./08_tcp_client.py
