#!/usr/bin/python3

import sys
import pefile

in_file = sys.argv[1]


for f_section in pefile.PE(in_file):
    print(f"{} MD5 Hash: {}\n{} SHA256 Hash: {}\n", f_section.NAME, f_section.get_hash_md5(), f_section.NAME, f_section.get_hash_sha256())
