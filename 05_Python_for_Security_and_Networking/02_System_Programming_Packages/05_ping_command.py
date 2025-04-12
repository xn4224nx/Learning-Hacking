#!/bin/python3
# Execute the ping command using python

import sys
import subprocess

ping_param = "-c 1"
domain = "www.cnn.com"

if __name__ == "__main__":
    curr_os = sys.platform.lower()
    print(f"Detected OS: {curr_os}")

    # Generate the ping command based on the operating system
    if curr_os.startswith("linux"):
        ping_comm = "/bin/ping"

    elif curr_os == "darwin":
        ping_comm = "/sbin/ping"

    elif curr_os == "nt":
        ping_comm = "ping"

    else:
        raise Exception(f"{curr_os} is not a supported os!")

    # Execute the ping command
    proc = subprocess.Popen(
        [ping_comm, ping_param, domain], shell=False, stderr=subprocess.PIPE
    )
    out = proc.stderr.read(1)
    sys.stdout.write(str(out.decode("utf-8")))
    sys.stdout.flush()
