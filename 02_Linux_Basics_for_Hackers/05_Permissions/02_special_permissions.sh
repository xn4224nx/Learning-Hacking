#!/bin/bash
# Special File & Folder Permission

# The SUID bit means any user can execute the file as owner, set the bit
# with the following command.
touch test
chmod 4744 test
rm test

# Find all files in the system with the SUID permission
sudo find / -perm -4000
