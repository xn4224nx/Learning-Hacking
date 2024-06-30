#!/bin/bash
# Changing File & Folder Permissions

# Changing Permissions With Octals
#   0   ---
#   1   --x
#   2   -w-
#   3   -wx
#   4   r--
#   5   r-x
#   6   rw-
#   7   rwx

# Set a file to have all permissions for user, group, everybody
touch test
chmod 777 test

# Remove all permissions
chmod 000 test

# Give read to everybody and all permissions to the user
chmod 744 test

# Give read & execute to everybody and all permissions to the user
chmod 755 test

rm test
