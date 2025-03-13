#!/bin/python3
# Working With Files In Python

filename = "text_file.txt"

# Write text to a file
with open(filename, "w") as fp:
    print(type(fp))
    fp.write("testline\n")
    fp.write("another line\n")
    fp.write("and another line\n")
    fp.write("the final line\n")

# Read text from file
with open(filename, "r") as fp:
    print(fp.read())

# Read lines from file
with open(filename, "r") as fp:
    for line in fp.readlines():
        print(line)
