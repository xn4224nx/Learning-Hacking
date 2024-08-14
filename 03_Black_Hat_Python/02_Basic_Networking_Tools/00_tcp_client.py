"""
TCP Client
==========

Create a TCP client, connect it to a server, send data to the server. Receieve
data back from the server, print it and then close the socket. Also:

    * AF_INET means the use of ipv4 or the hostname.

    * SOCK_STREAM indicates a TCP client

Wed 14 Aug 14:50:34 BST 2024
"""

import socket

target_host = "www.cnn.com"
target_port = 80

# Create a socket object
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect the client to the server
client.connect((target_host, target_port))

# Send some data to the server
client.send(b"GET / HTTP/1.1\r\nHost: cnn.com\r\n\r\n")

# Receieve some data back from the server
response = client.recv(4096)

# Show the response
print(response.decode())

client.close()
