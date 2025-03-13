#!/bin/python3
# Learning and Understanding Exception Management in Python

# Catching Exceptions
try:
    print(f"10/0 = {10/0}")
except ZeroDivisionError as err:
    print(f"Error = {err}")

try:
    ele = [1]
    print(ele[7])
except Exception as err:
    print(f"Error = {err}")


# Show all the exceptions
def print_exceptions(ExceptionClass, level=0):
    if level > 1:
        print("    |" * (level - 1), end="")

    if level > 0:
        print("    +---", end="")

    print(ExceptionClass.__name__)

    for subclass in ExceptionClass.__subclasses__():
        print_exceptions(subclass, level + 1)


print_exceptions(BaseException)
