#!/bin/python3
# Advanced Port Scanner

import threading
import socket as sck


def socket_scan(host: str, port: int):
    """
    For a specific host and port report to stdout what the result is.
    """
    try:
        sock = sck.socket(sck.AF_INET, sck.SOCK_STREAM)
        sock.settimeout(5)
        result = sock.connect((host, port))
        print(f"[+] {port}/tcp open")

    except Exception as err:
        print(f"[-] {port}/tcp closed\n" f"[-] Reason: {str(err)}")
    finally:
        sock.close()


def port_scan(host: str, ports_to_scan: list[int]):
    """
    Scan a range of ports for a particular host.
    """
    try:
        ip = sck.gethostbyname(host)

    except Exception as err:
        print(f"[-] Cannot resolve the host {host} due to {err}")
        return

    print(f"[+] Scan results for: {ip}", end="")
    try:
        name = sck.gethostbyaddr(ip)
        print(f" - {name}", end="")
    except:
        pass
    finally:
        print()

    for port in ports_to_scan:
        threading.Thread(target=socket_scan, args=(ip, port)).start()


if __name__ == "__main__":
    port_scan("scanme.nmap.org", [22, 23, 80, 81])
