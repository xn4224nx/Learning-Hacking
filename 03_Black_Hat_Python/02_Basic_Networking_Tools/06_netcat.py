"""
Netcat
======

Netcat is a network utility that read and writes to connections using UDP
and TCP

Thu 15 Aug 16:16:39 BST 2024
"""

import argparse
import socket
import shlex
import subprocess
import sys
import textwrap
import threading


def execute(cmd: str) -> str | None:
    """
    Run a command on the local system and return the string output. If
    the command is empty it returns None.
    """
    cmd = cmd.strip()

    if not cmd:
        return None

    out = subprocess.check_output(shlex.split(cmd), sderr=subprocess.STDOUT)
    return out.decode()


class NetCat:
    def __init__(self, args, buff=None):
        self.args = args
        self.buff = buff
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    def run(self):
        if self.args.listen:
            self.listen()
        else:
            self.send()

    def send(self):
        self.socket.connect((self.args.target, self.args.port))
        if self.buff:
            self.socket.send(self.buff)

        try:
            while True:
                recv_len = 1
                response = ""
                while recv_len:
                    data = self.socket.recv(4096)
                    recv_len = len(data)
                    response += data.decode()

                    if recv_len < 4096:
                        break

                if response:
                    print(response)
                    buff = input("> ")
                    buff += "\n"
                    self.socket.send(buff.encode())

        except KeyboardInterrupt:
            print("User terminated")
            self.socket.close()
            sys.exit()

    def listen(self):
        self.socket.bind((self.args.target, self.args.port))
        self.socket.listen(5)

        while True:
            client_socket, _ = self.socket.accept()
            client_thead = threading.Thread(target=self.handle, args=(client_socket,))
            client_thead.start()

    def handle(self, client_socket):
        if self.args.execute:
            output = execute(self.args.execute)
            client_socket.send(output.encode())

        elif self.args.upload:
            file_buff = b""
            while True:
                data = client.recv(4096)
                if data:
                    file_buff += data
                else:
                    break

            with open(self.args.upload, "wb") as f:
                f.write(file_buff)

            client.socket.send(f"Saved file {self.args.upload}".encode())

        elif self.args.command:
            cmd_buff = b""
            while True:
                try:
                    client_socket.send(b"BHP: #> ")
                    while "\n" not in cmd_buff.decode():
                        cmd_buff += client_socket.recv(64)

                    response = execute(cmd_buff.decode())

                    if response:
                        client_socket.send(response.encode())

                    cmd_buff = b""

                except Exception as e:
                    print(f"Server killed {e}")
                    self.socket.close()
                    sys.exit()


if __name__ == "__main__":
    desc = """Example:
    06_netcat.py -t 192.168.1.108 -p 5555 -l -c # command shell
    06_netcat.py -t 192.168.1.108 -p 5555 -l -u # upload to file
    06_netcat.py -t 192.168.1.108 -p 5555 -l -e=\"cat /etc/passwd\" # execute command
    echo 'ABC' | ./06_netcat.py -t 192.168.1.108 -p 135 # echo text to server port 135
    06_netcat.py -t 192.168.1.108 -p 5555 # connect to server
    """

    parser = argparse.ArgumentParser(
        description="BHP Net Tool",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=textwrap.dedent(desc),
    )

    parser.add_argument("-c", "--command", action="store_true", help="command shell")
    parser.add_argument("-e", "--execute", help="execute specified command")
    parser.add_argument("-l", "--listen", action="store_true", help="listen")
    parser.add_argument("-p", "--port", type=int, default=5555, help="specified port")
    parser.add_argument("-t", "--target", default="192.168.1.203", help="specified IP")
    parser.add_argument("-u", "--upload", help="upload file")
    args = parser.pars_args()

    if args.listen:
        r_buffer = ""
    else:
        r_buffer = sys.stdin.read()

    nc = NetCat(args, r_buffer.encode())
    nc.run()
