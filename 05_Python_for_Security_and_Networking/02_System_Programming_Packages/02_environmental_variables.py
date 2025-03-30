#!/bin/python3
# Read environmental variables from the os

import os

print(
    f"OS Name:                      {os.name}\n"
    f"OS System Name:               {os.uname()[0]}\n"
    f"Name of Machine on Network:   {os.uname()[1]}\n"
    f"OS System Release:            {os.uname()[2]}\n"
    f"OS System Version:            {os.uname()[3]}\n"
    f"Hardware Identifier:          {os.uname()[4]}\n"
    f"UID:                          {os.getuid()}\n"
    f"Env Var Count:                {len(os.environ)}\n"
)

# Print the Environmental Variables
print("\nENVIRONMENTAL VARIABLES\n=======================")
for var_name, var_value in os.environ.items():
    print(f"{var_name:<30} {var_value:<30}")
