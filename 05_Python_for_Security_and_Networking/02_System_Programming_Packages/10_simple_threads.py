#!/bin/python3
# Working with threads in Python

import threading


def smp_task():
    print(f"Hello from: {threading.current_thread()}")


if __name__ == "__main__":
    curr_thread = threading.Thread(target=smp_task)
    curr_thread.start()
