#!/bin/bash
# Creating Tars

# Directory to store raw data
mkdir ./tmp

# Array of files that will be created
files=($(seq 1000 | xargs printf "file_%04d.txt\n"))

# Create each of the files and fill with random data
for i in "${files[@]}"
do
    openssl rand -out ./tmp/$i -base64 $(( 10**6 * 4 * 3/4 ))
done

# Combine all the files into a tarball (No Compression)
tar -cf archive.tar ./tmp

# Compress the tarball with gzip
gzip -k -9 archive.tar

# Compress the tarball with bzip2
bzip2 -k -9 archive.tar

# Compress the tarball with 7zip
p7zip -k ./archive.tar > /dev/null

# Show the size of the files
ls -l

# Clean up the scripts
rm -rf ./tmp 
rm archive*
