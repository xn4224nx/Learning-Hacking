#!/bin/python3
import subprocess

if __name__ == "__main__":
    while True:
        prog_name = input("Enter the name of the program: ")

        if prog_name.lower() in ["exit", "quit", "q"]:
            break

        proc = subprocess.run(["which", prog_name], capture_output=True, text=True)

        if proc.returncode == 0:
            print(
                f"The program {prog_name} is installed\n"
                f"The location of the program is {proc.stdout}\n"
            )
        else:
            print(f"The program is not installed:\n{proc.stderr}\n")
