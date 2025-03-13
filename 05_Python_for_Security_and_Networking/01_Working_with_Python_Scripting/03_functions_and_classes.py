#!/bin/python3
# Python Functions and Classes

# Anonymous Functions
d_orig = lambda x, y: (x * x + y * y) ** 0.5

for a, b in [(1, 1), (0, 6), (-3, -7)]:
    print(f"Point ({a},{b}) is {d_orig(a,b):.2f} units away from the origin.")


# Functions
def pretty_print(data: dict):
    for key, value in data.items():
        print(f"\n{key}")
        for val in value:
            print(f"\t{val}")


pretty_print(
    {
        "a": [1, 2, 3],
        "b": [4],
        "c": [2, 34, 4, 4, 4],
        "d": [10, 10, 2, 2],
        "e": [0, 0, 0, 0],
    }
)


# Classes
class Protocol(object):
    def __init__(self, name: str, number: int, desc: str):
        self.name = name
        self.number = number
        self.desc = desc

    def getProtocolInfo(self):
        return f"{self.name} {self.number} {self.desc}"


https = Protocol("HTTPS", 443, "Hypertext Transfer Protocol Secure")
print(https.getProtocolInfo())


# Inheritance
class Transfer(Protocol):
    def __init__(self, name: str, number: int, desc: str):
        Protocol.__init__(self, name, number, desc)

    def replicate(self):
        return [x for x in range(0, self.number)]


ssh = Transfer("SSH", 22, "Secure Shell Protocol")
print(ssh.getProtocolInfo())
print(ssh.replicate())

print(f"Protocol ->  Transfer: {issubclass(Transfer, Protocol)}")
print(f"Transfer ->  Protocol: {issubclass(Protocol, Transfer)}")
print(f"ssh = Transfer: {isinstance(ssh, Transfer)}")
print(f"ssh = Protocol: {isinstance(ssh, Protocol)}")
print(f"https = Transfer: {isinstance(https, Transfer)}")
print(f"https = Protocol: {isinstance(https, Protocol)}")
