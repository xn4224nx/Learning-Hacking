#!/bin/python3
# Implementing A Simple TCP Server


import socket as sck

if __name__ == "__main__":
    client_data = "."
    server_conn = ("127.0.0.1", 9999)

    # Create the socket object for the server
    with sck.socket(sck.AF_INET, sck.SOCK_STREAM) as server:

        # Set what address and port the server is listening on
        server.bind(server_conn)

        # Tell the server to wait for clients and set the maximum number of connections
        server.listen(10)
        print(f"[S] listening on {server_conn[0]}:{server_conn[1]}")

        # Recieve the incomming connection from the client
        sck_client, (host, port) = server.accept()
        print(f"[S] client connection on {host}:{port}")

        # Send the introductory message
        sck_client.send("Hello client I am the server!".encode())

        # Recieve and show the data from the client until they quit
        while client_data.lower()[0] != "q":
            client_data = sck_client.recv(1024).decode()
            print(f'[S] client data: "{client_data}"')

        print(f"[S] Shutting down connection to client on {host}:{port}")
        sck_client.close()
