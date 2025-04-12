#!/bin/python3
# Setup and activate a virtual environment

import subprocess
from pathlib import Path

venv_loc = Path("venv")

if __name__ == "__main__":
    # See if the virtual environment module is installed
    try:
        import venv

        print("Virtual environment module is installed.")
    except Exception as err:
        raise OSError(f"Virtual environment module is NOT installed:\n{err}")

    # Find the Python Executable
    proc = subprocess.run(["which", "python3"], capture_output=True, text=True)
    if proc.returncode != 0:
        raise OSError("Python3 cannot be found")
    else:
        py_path = proc.stdout.split("/")[-1].strip()

    # Setup the virtual environment
    create_env = subprocess.run(
        [py_path, "-m", "venv", venv_loc], check=True, capture_output=True, text=True
    )

    if create_env != 0:
        raise OSError(f"The venv could not be created: {create_env.stderr}")
