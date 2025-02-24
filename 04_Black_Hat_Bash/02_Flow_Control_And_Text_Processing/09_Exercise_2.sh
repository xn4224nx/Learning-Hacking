#!/usr/bin/env bash
CSV_FILE="ping_results.csv"

# Ensure that the two arguments are present
if [[ $# -ne 2 ]]; then
    echo -e "\n\nThis script requires two arguments, name and domain."
    echo -e "For example:\n\t${0} mysite nostarch.com"
    exit 1
fi

# Ping the domain and ensure its active and responding
if ping ${2} -c 5 -q; then
    RESULT="SUCCESS"
else
    RESULT="FAILURE"
fi

# Check the CSV file exists and if not create it and its header
if ! [[ -f ${CSV_FILE} ]]; then
    echo "NAME,DOMAIN,PING_RESULT,DATETIME" > ${CSV_FILE}
fi

# Save results to a CSV file with columns NAME, DOMAIN, PING_RESULT, DATETIME
echo "'${1}','${2}',${RESULT},$(date +%Y_%m_%d_%H:%M:%S)" >> ${CSV_FILE}
