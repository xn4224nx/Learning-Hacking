#!/bin/python3
# Executing ThreadPoolExecutor with a context manager

from concurrent.futures import ThreadPoolExecutor, as_completed
from random import randint
import threading


def execute(name):
    value = randint(0, 1000)
    thread_name = threading.current_thread().name
    print(f"I am {thread_name} and my value is {value}")
    return (thread_name, value)


if __name__ == "__main__":
    with ThreadPoolExecutor(max_workers=5) as executor:
        futures = [executor.submit(execute, f"T{idx}") for idx in range(5)]

        for future in as_completed(futures):
            nm, val = future.result()
            print(f"Thread {nm} returned {val}")
