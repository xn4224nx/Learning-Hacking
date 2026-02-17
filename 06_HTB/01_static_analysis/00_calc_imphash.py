#!/usr/bin/python3

import sys
import pefile
import peutils

in_file = sys.argv[1]
print(pefile.PE(in_file).get_imphash())
