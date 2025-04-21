#!/bin/python3
import threading
import timeit


class MyThread(threading.Thread):
    def __init__(self, message):
        threading.Thread.__init__(self)
        self.message = message

    def run(self):
        print(self.message)


def test():
    threads = []

    for num in range(10):
        thread = MyThread(f"I am the {num} thread")
        thread.name = num
        thread.start()

    # Wait for all the threads to complete
    for thread in threads:
        thread.join()


if __name__ == "__main__":
    print(timeit.timeit("test()", setup="from __main__ import test"), number=5)
