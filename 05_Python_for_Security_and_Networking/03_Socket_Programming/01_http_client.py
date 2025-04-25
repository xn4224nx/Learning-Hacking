#!/bin/python3
# Using the socket module request http pages

import socket
from urllib.parse import urlsplit


def request_web_page(url: str) -> str:
    """
    Request the raw webapge from the specified url.
    """
    split_url = urlsplit(url)
    msg = ""

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sck:
        sck.connect((split_url.netloc, 80))
        sck.send(f"GET {url} HTTP/1.0\r\n\r\n".encode())

        # Receive the data from the server
        while data := sck.recv(512):
            msg += data.decode()

    return msg


if __name__ == "__main__":
    print(request_web_page("http://ftp.debian.org/debian/README.mirrors.txt"))
