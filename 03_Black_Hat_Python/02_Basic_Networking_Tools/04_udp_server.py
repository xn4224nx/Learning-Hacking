"""
UDP Server
==========

Initalise a UDP Server and communicate with a client that is defined in another
script. The code for this script is taken from:

https://pythontic.com/modules/socket/udp-client-server-example
"""

import socket

IP = "127.0.0.1"
PORT = 20001


if __name__ == "__main__":

    # Create the socket
    sev_soc = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Bind it to an address and ip
    sev_soc.bind((IP, PORT))

    print(f"[s] Server Started")

    # Start listening for incoming connections
    comm_cnt = 0
    while comm_cnt < 5:
        msg, addr = sev_soc.recvfrom(1024)
        print(f"[s] Message Received:\n\tAddr\t{addr}\n\tMsg\t'{msg.decode()}'\n")

        # Reply back to client
        sev_soc.sendto(b"Hello to you too!", addr)

        comm_cnt += 1

    print("[s] Shutting server down.")
    sev_soc.close()
