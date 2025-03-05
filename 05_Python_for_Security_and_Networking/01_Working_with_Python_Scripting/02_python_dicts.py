#!/bin/python3
# Using Python Dictionaries

# Define a dictionary
services = {"FTP": 21, "SSH": 22, "SMTP": 25, "HTTP": 80}

print(type(services))

# Accessing a key by value
print(f"FTP value {services["FTP"]}")

# Access a key and supply a default value if its missing
print(f"HTTPS value {services.get("HTTPS", "Number not set!")}")

# Combine dictionaries
services = services | {"HTTPS": 80}
print(services)

# Set a value using a key
services["HTTPS"] = 0
print(services)

# Iterating over a dictionaries
for key, value in services.items():
    print(key, value)

for key in services:
    print(key)

for values in services.values():
    print(values)

# Removing the last value from a dictionarie
print(services.popitem())

# Remove a key value pair
print(services.pop("SSH"))
del services["FTP"]

print(services)

# Remove everything from a dictionary
services.clear()
print(services)
