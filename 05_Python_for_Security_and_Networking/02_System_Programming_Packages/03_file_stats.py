#!/bin/python3
# Detailed File Statistics

from pathlib import Path
import time

fstat = Path("03_file_stats.py").stat()

print(
    f"FILE STATISTICS\n"
    f"===============\n"
    f"File Mode:             {oct(fstat.st_mode)}\n"
    f"File ID:               {fstat.st_ino}\n"
    f"Device ID:             {fstat.st_dev}\n"
    f"Number of Hard Links:  {fstat.st_nlink}\n"
    f"File Owner ID:         {fstat.st_uid}\n"
    f"File Group ID:         {fstat.st_gid}\n"
    f"File Size (bytes):     {fstat.st_size}\n"
    f"Last File Access Time: {time.ctime(fstat.st_atime)}\n"
    f"Last File Modify Time: {time.ctime(fstat.st_mtime)}\n"
    f"Last Meta Modify Time: {time.ctime(fstat.st_ctime)}\n"
)
