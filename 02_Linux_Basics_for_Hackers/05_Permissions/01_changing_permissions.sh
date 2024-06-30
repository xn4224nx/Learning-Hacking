#!/bin/bash
# Changing File & Folder Permissions


### Changing Permissions With Octals
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


### Changing permissions with UGO

#   +   add
#   -   remove
#   =   set

#   u   user
#   g   group
#   o   others

#   r   read
#   w   write
#   x   execute

# Add write permission for a user
chmod u+w test

# Remove read for others
chmod o-r test

# Set group permission to read, write, execute
chmod g=rwx test

rm test


# Show the default umask
echo -e "\nThe default umask for this system is: $(umask)"

# Show the file the umask reads
echo -e "\nIn '.profile' this is defined as:"
cat ~/.profile | head -9 | tail -1
