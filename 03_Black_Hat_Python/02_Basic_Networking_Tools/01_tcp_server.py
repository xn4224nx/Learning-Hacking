"""
TCP Server
==========

Start a TCP server that recieves connections on the specified port and IP address
and send a canned response.

Wed 14 Aug 15:43:39 BST 2024
"""

import socket
import threading

IP = "127.0.0.1"
PORT = 9997
MAX_RESP = 5


def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((IP, PORT))
    server.listen(5)
    print(f"[S] Listening on {IP}:{PORT}")
    responses = 0

    while responses < MAX_RESP:
        client, address = server.accept()
        print(f"[S] Accepted connection from {address[0]}:{address[1]}")

        client_handler = threading.Thread(target=handle_client, args=(client,))
        client_handler.start()

        responses += 1

    # Shut the server
    server.close()
    print(f"[S] Server shut down.")


def handle_client(client_socket):
    with client_socket as sock:
        request = sock.recv(1024)
        print(f"[S] Recieved: {request.decode('utf-8').strip()}")
        sock.send(b"Hello from the server!\n")
        print(f"[S] Sent response back.")


if __name__ == "__main__":
    main()
