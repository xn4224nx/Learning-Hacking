#!/bin/python3
# Make multiple requests using threads

import requests
from concurrent.futures import ThreadPoolExecutor, as_completed
from time import time

test_urls = [
    "http://www.python.org",
    "http://www.google.com",
    "http://www.packtpub.com",
    "http://www.goooooooogle.com",
]


def request_url(url: str) -> str:
    result = requests.get(url, stream=True)
    return f"{url} ---> {result.status_code}"


if __name__ == "__main__":
    with ThreadPoolExecutor(max_workers=10) as exe:
        curr_procs = [exe.submit(request_url, x) for x in test_urls]

    for task in as_completed(curr_procs):
        print(task.result())
