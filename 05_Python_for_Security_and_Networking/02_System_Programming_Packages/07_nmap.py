#!/bin/python3
import subprocess

proc = subprocess.Popen(
    ["nmap", "127.0.0.1"], stdout=subprocess.PIPE, stderr=subprocess.PIPE
)
cap_stdout, cap_stderr = proc.communicate()
print(cap_stdout.decode())
