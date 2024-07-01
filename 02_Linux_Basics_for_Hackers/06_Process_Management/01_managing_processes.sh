#!/bin/bash
# Managing Processes

# -20   Most likely to receive priority
#   0   Default nice value
# +19   Least likely to receive priority

# Increase a processes priority when starting it.
nice -n -10 /bin/date

# Decrease a processes priority when starting it.
nice -n 10 /bin/date

# Change the priority of a running process
renice 20 9189

# Kill a process by PID
kill -9 14444

# Kill a process by name 
killall -9 firefox
