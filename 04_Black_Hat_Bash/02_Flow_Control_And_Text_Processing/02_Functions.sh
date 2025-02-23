#!/usr/bin/env bash

# Define a simple function
say_hello(){
    echo "Hello user!"
}

# Invoke the function
say_hello

# Returning values from a function
is_user_root(){
    if [ "${EUID}" = "0" ]; then
        return 0
    else
        return 1
    fi
}

# Test the output of the function
if is_user_root; then
    echo "User is root!"
else
    echo "User is not root!"
fi

# Accepting arguments to a function
say_hello_to_user(){
    echo "Hello ${1} ${2}, welcome to the system!"
}

say_hello_to_user Mustrum Ridcully
