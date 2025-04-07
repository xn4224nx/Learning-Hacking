#!/bin/python3
# Executing Commands With the Subprocess Module

import subprocess
import sys

# Capture the details of the files & folders in this directory to a variable
dir_conts = subprocess.run(["ls", "-al"], stdout=subprocess.PIPE)
print(dir_conts.stdout.decode("utf-8"))

for cmd in [
    ["find", "/unknown_dir", "."],
    [sys.executable, "-c", "import sys; print(sys.stdin.read())"],
    [sys.executable, "-c", "raise Exception('An error from py!!')"],
    [sys.executable, "-c", "import time; time.sleep(10)"],
]:

    # Deal with an error from a command
    try:
        proc_result = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            check=True,
            timeout=5,
            input=b"\n\nhello from python",
        )
        print(proc_result.stdout.decode("utf-8"))

    except subprocess.CalledProcessError as err:
        print(f"Error during command: {err}")
