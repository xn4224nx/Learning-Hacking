#!/bin/python3
# Gather Infomation using Sockets

import socket as sck


def host_analysis(hostname: str) -> str:
    """
    Perform analysis of a hostname or IP address and return a string of the
    analyis.
    """
    res = f"\nANALYSIS: {hostname}\n" + "==========" + len(hostname) * "=" + "\n"
    res += f"\tHostname IP Address = {sck.gethostbyname(hostname)}\n"

    hostname, aliaslist, ipaddrlist = sck.gethostbyname_ex(hostname)
    res += (
        f"\tHostname = {hostname}\n"
        f"\tAliases = {aliaslist}\n"
        f"\tIP Addrs = {ipaddrlist}\n"
    )
    res += f"\tFully Qualified Domain Name = {sck.getfqdn(hostname)}\n"

    hostname, aliaslist, ipaddrlist = sck.gethostbyaddr(hostname)
    res += (
        f"\tHostname = {hostname}\n"
        f"\tAliases = {aliaslist}\n"
        f"\tIP Addrs = {ipaddrlist}\n"
    )

    family, a_type, proto, canonname, sockaddr = sck.getaddrinfo(
        hostname, None, 0, sck.SOCK_STREAM
    )[0]
    res += (
        f"\tAddress Family = {family}\n"
        f"\tAddress Type = {a_type}\n"
        f"\tPrototype = {proto}\n"
        f"\tCannonical Name = {canonname}\n"
        f"\tSocket Address = {sockaddr}\n"
    )
    return res


def port_analysis() -> str:
    """
    Find the port name for multiple port numbers and return a string with the
    details.
    """
    res = "\nPORT ANALYSIS\n=============\n"
    for port_num in range(65535):
        try:
            res += f"\t{port_num:>5}: {sck.getservbyport(port_num)}\n"
        except:
            pass
    return res


if __name__ == "__main__":
    curr_hostnm = sck.gethostname()
    print(host_analysis(curr_hostnm))
    print(host_analysis("8.8.8.8"))
    print(port_analysis())
