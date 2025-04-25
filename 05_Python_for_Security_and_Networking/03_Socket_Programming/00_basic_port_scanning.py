#!/bin/python3
# Using the sockets module scan for open ports
import socket


def scan_port(sc_ip: str, sc_port: int) -> str:
    """
    Scan a particular port using IP4, of a specific IP address and return the
    result.
    """
    port_lookup = {21: "ftp", 22: "ssh", 23: "telnet", 80: "http", 53: "dns"}

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sck:
        result = sck.connect_ex((sc_ip, sc_port))

    if sc_port in port_lookup:
        return f"{sc_ip} : {sc_port} ({port_lookup[sc_port]}) -> {result}"
    else:
        return f"{sc_ip} : {sc_port} -> {result}"


if __name__ == "__main__":
    for port in range(100):
        print(scan_port("192.168.178.1", port))
