#!/usr/bin/python3

import sys
from pwn import *

context(os="linux", arch="amd64", log_level="error")

bin_file = ELF(sys.argv[1])
shellcode = bin_file.section(".text")
print(shellcode.hex())
