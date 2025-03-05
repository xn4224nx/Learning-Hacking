#!/bin/python3
# Basic Python List Usage

# Initialising a list with values
responses = [200, 300, 400, 500]

# Accessing list values by index
print(responses[0])
print(responses[-1])

# Initialising an empty list
protocols = []

# Appending to a list
protocols.append("FTP")
protocols.append("SSH")
protocols.append("SMTP")
protocols.append("HTTP")

# Sort a list
print(protocols)
protocols.sort()
print(protocols)

# Accessing characteristics of the list
print(len(protocols))
print(type(protocols))

# Count the amount of a certian element in a list
print(protocols.count(200))

# Accessing elements by values
print(f"SMPT index: {protocols.index("SMTP")}")

# Removing elements by value
print(protocols)
protocols.remove("SSH")
print(protocols)

# Remove the last value in a list
protocols.pop()
print(protocols)

# Reverse a list
protocols.reverse()  # protocols[::-1]
print(protocols)

# Insert at a position in the list
protocols.insert(0, "HTTPS")

# Set the value of an element in a list
protocols[0] = "TLS"
print(protocols)

# Concaternating lists
responses += [600, 700, 800, 900, 1000]
responses.extend([1100, 1200, 1300, 1400])

# Check value in a list
print(-100 in responses)
