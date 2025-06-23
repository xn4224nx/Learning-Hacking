#!/bin/python3
# Implementing A Simple TCP Client

import socket as sck
import time

if __name__ == "__main__":
    server_conn = ("127.0.0.1", 9999)

    # Attempt to connect to the server
    with sck.socket(sck.AF_INET, sck.SOCK_STREAM) as ser_sock:
        ser_sock.connect(server_conn)
        print(f"[C] connected to host: {server_conn[0]}:{server_conn[1]}")

        # Recieve introductory message from the server
        msg = ser_sock.recv(1024).decode()
        print(f'[C] message recieved from server: "{msg}"')

        # Send user data to the server
        while msg.lower()[0] != "q":
            time.sleep(1)
            msg = input("[C] Enter your message > ")
            ser_sock.sendall(bytes(msg.encode("utf-8")))
