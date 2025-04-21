#!/bin/python3
# Concurrency in Python with ThreadPoolExecutor

from concurrent.futures import ThreadPoolExecutor
import threading


def task(n):
    print(
        f"Processing {n}\n"
        f"Accessing thread: {threading.get_ident()}\n"
        f"Thread Executed {threading.current_thread()}\n"
    )


if __name__ == "__main__":
    print("Starting ThreadPoolExecutor\n")
    executor = ThreadPoolExecutor(max_workers=3)

    for idx in range(5):
        future = executor.submit(task, (idx))

    print("All tasks complete")
