#!/usr/bin/env bash

# Take the first argument given to the script
IP_ADDRESS=${1}

# Decide what effects to implement based on the variable
case ${IP_ADDRESS} in

    192.168.*)
        echo "Network is 192.168.x.x"
    ;;

    10.0.*)
        echo "Network is 10.0.x.x"
    ;;

    *)
        echo "Unidentified network!"
    ;;
esac

