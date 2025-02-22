#!\usr\bin\env bash

tempfile="./tempfile.txt"

# String comparisons
if [ "a" = "a" ]; then
    echo -e "strings are equal"
fi

if [ "b" != "a" ]; then
    echo -e "strings are not equal"
fi

# Check for null strings
if [ -z "" ]; then
    echo -e "string is null"
fi

# Check for non null strings
if [ -n "a" ]; then
    echo -e "string is not null"
fi

# Negating conditions
if [ ! -f ${tempfile} ]; then
    echo "Temp file ${tempfile}, doesn't exist, creating it now"
    > ${tempfile}
fi

# Combining conditions
if [ -r ${tempfile} ] && [ -w ${tempfile} ]; then
    echo "${tempfile} is readable and writable"
fi

# Test command outcomes
if rm ${tempfile}; then
    echo "${tempfile} successfully removed!"
fi
