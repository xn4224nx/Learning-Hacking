#!/bin/python3
# Managing Socket Exceptions

import socket as sck


def address_investigation(host: str, port: int):
    """
    Find out infomation about a particular address.
    """
    try:
        addr = sck.socket(sck.AF_INET, sck.SOCK_STREAM)
        print(addr)
        addr.settimeout(5)

    except sck.error as err:
        print(f"Socket create error: {err}")

    try:
        addr.connect((host, port))
        print(addr)

    except sck.timeout as err:
        print(f"Timeout: {err}")

    except sck.gaierror as err:
        print(f"Connection error to server {err}")

    except sck.error as err:
        print(f"Connection error {err}")


if __name__ == "__main__":
    address_investigation("domain/ip_address", 80)
    address_investigation("cnn.com", 80)
