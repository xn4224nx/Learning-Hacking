"""
UDP Client
==========

Communitcate with a UDP server and recieve responses.

Wed 14 Aug 15:10:24 BST 2024
"""

import socket

IP = "127.0.0.1"
PORT = 20001

# Create the socket object
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Send some data to the server
print("[c] Contacting Server")
client.sendto(b"Hi are you there server?", (IP, PORT))

# Receive data from the server
data, address = client.recvfrom(1024)
print(f"[c] Server Response:\n\t'{data.decode()}'\n")

client.close()
