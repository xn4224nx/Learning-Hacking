#!/bin/python3
# Implementing a Port Scanner

import socket
import sys
from datetime import datetime
import errno


def port_scan(host: str, port_range: (int, int) = (0, 65535)):
    """
    Scan a range of ports on one particular host.
    """
    remote_server_ip = socket.gethostbyname(host)
    time_init = datetime.now()

    title = (
        f"\nSCANNING {host} ({remote_server_ip}): "
        f"{port_range[0]} -> {port_range[1]+1}\n"
    )
    print(title + "=" * len(title))

    try:
        for port in range(port_range[0], port_range[1] + 1):
            print(f"\t{port:>5}: ", end="")

            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sck:
                sck.settimeout(5)
                result = sck.connect_ex((remote_server_ip, port))

                if result == 0:
                    print("OPEN")
                else:
                    print(f"CLOSED - {errno.errorcode[result]}")

    except KeyboardInterupt:
        print("Keyboard interupt!")
        sys.exit()

    except socket.gaierror:
        print("Hostname could not be resolved!")
        sys.exit()

    except socket.error:
        print("Could not connect to the server!")
        sys.exit()

    print(
        f"\nPorts {port_range[0]} -> {port_range[1]+1}"
        f" scanned in {datetime.now()-time_init}"
    )


if __name__ == "__main__":
    port_scan("scanme.nmap.org", (80, 82))
    port_scan("cnn.com", (0, 100))
