#!/bin/python3
# Multithreading in Python

import threading


class ThreadWorker(threading.Thread):
    def __init__(self):
        super(ThreadWorker, self).__init__()

    def run(self):
        for idx in range(10):
            print(idx)


if __name__ == "__main__":
    thread = ThreadWorker()
    thread.start()
