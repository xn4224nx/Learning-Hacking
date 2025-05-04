#!/bin/python3
# Basic Client With the Socket Module

import socket as sck


def probe_server(host: str, port: int):
    """
    Send and recieve data from a server using TCP communications.
    """
    req = f"GET / HTTP/1.1\r\nHost:{host}\r\n\r\n"

    try:
        with sck.socket(sck.AF_INET, sck.SOCK_STREAM) as sck_tcp:
            sck_tcp.settimeout(10)

            if sck_tcp.connect_ex((host, port)) == 0:
                print(f"Connection established to server {host} : {port}")
                sck_tcp.send(req.encode())
                data = sck_tcp.recv(4096)
                print(f"Data: {data}\nLen Data:{len(data)}\n")

    except sck.timeout as err:
        print(f"Timeout: {err}\n")

    except sck.gaierror as err:
        print(f"Connection error to server: {err}\n")

    except sck.error as err:
        print(f"Connection error: {err}\n")


if __name__ == "__main__":
    probe_server("domain/ip_address", 80)
    probe_server("www.cnn.com", 80)
    probe_server("www.bbc.co.uk", 80)
