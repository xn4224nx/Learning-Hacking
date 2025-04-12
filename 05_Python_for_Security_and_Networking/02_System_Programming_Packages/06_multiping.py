#!/bin/python3
# Execute multiple ping commands

from subprocess import PIPE, Popen
import sys

ping_comm = "/bin/ping"
ping_param = "-c 1"

if __name__ == "__main__":
    for sc_ip in range(1, 4):
        ip_addr = f"192.168.18.{sc_ip}"

        print(f"\nScanning: {ip_addr}")
        sc_process = Popen(
            [ping_comm, ping_param, ip_addr], stdin=PIPE, stdout=PIPE, stderr=PIPE
        )
        cap_stdout, capstd_err = sc_process.communicate(input=None)

        # Determine if the scan was successful
        if b"bytes from " in cap_stdout:
            print(f"{ip_addr} RESPONDED")
        else:
            print(f"{ip_addr} SILENT")
