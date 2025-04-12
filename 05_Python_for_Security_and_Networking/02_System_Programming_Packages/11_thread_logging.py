#!/bin/python3
# Log the interactions of threads

import threading
import logging
import time

logging.basicConfig(
    level=logging.DEBUG, format="[%(levelname)s] - %(threadName)-10s : %(message)s"
)


def thread_act(thread_name: str):
    logging.debug(f"Starting thread {thread_name}")
    time.sleep(5)
    print(f"{thread_name}: {time.ctime(time.time())}")
    logging.debug(f"Stopping {thread_name}")


def check_state(c_thread: threading.Thread):
    print(f"Thread {c_thread.name} is alive: {c_thread.is_alive()}")


if __name__ == "__main__":
    th0 = threading.Thread(target=thread_act, args=("THREAD_00",))
    th1 = threading.Thread(target=thread_act, args=("THREAD_01",))

    th0.daemon = True

    th0.start()
    th1.start()

    check_state(th0)
    check_state(th1)

    while th0.is_alive():
        logging.debug("Thread is executing...")
        time.sleep(1)

    th0.join()
    th1.join()
