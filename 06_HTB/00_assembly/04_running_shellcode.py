#!/usr/bin/python3

from pwn import *

context(os="Linux", arch="amd64", log_level="error")

sh_code = (
    "b03b4831d25248bf2f62696e2f2f7368574889e752574889e60f05"
)

run_shellcode(unhex(sh_code)).interactive()
