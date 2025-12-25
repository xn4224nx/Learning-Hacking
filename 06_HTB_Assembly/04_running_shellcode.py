#!/usr/bin/python3

from pwn import *

context(os="Linux", arch="amd64", log_level="error")

sh_code = (
    "4831db66bb79215348bb422041636164656d5"
    "348bb48656c6c6f204854534889e64831c0b0"
    "014831ff40b7014831d2b2120f054831c0043c4030ff0f05"
)

run_shellcode(unhex(sh_code)).interactive()
