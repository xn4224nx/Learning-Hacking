#!/usr/bin/env bash

# Generate IP Addresses in a range using a loop
for ip in $(seq 1 254); do
    echo -e "172.16.10.${ip}"
done

# Generate using echo then insert new lines instead of spaces
echo 10.1.0.{1..254} | sed 's/ /\n/g'

# Or do it using printf
printf "10.1.0.%d\n" {1..254}

# Generate possible subdomains of a site
DOMAIN="example.com"
WORD_LIST_FILE="/usr/share/dict/words"

# Read the wordlist file and create subdomains
while read -r subdomain; do

    # Check the word is suitable, otherwise skip it
    if [[ ${subdomain} == *"'"* ]]; then
        continue
    fi

    # Lowercase the word
    s_domain_low=$( echo "${subdomain}" | tr '[:upper:]' '[:lower:]')

    echo "${s_domain_low}.${DOMAIN}"

done < "${WORD_LIST_FILE}"
