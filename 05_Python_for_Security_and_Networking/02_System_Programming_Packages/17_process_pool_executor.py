#!/bin/python3
# processPool_concurrent_futures

from concurrent.futures import ProcessPoolExecutor
import os


def task():
    print(f"Executing our task on process {os.getpid()}")


if __name__ == "__main__":
    exe = ProcessPoolExecutor(max_workers=3)
    task1 = exe.submit(task)
    task2 = exe.submit(task)
