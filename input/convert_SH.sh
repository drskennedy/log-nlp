#!/bin/bash

# Script to clean SH messages file before NLP process.
# It takes one input: messages files name.
# It outputs a cleaned filed by removing month and day, hostname 
# as well as non alphabet sequences.
#

[[ $# -lt 1 ]] && echo "input file not given; argc == $#" &&  exit 1

FILE=$1

if [[ -n "${2}" ]]; then
    OUTFILE="$2"
else
    OUTFILE="sh_msg.txt"
fi

[[ ! -f $FILE ]] && echo "$FILE doesn't exist" && exit 2

#egrep -v '[^a-zA-Z]\+|httpd|VERSION' $FILE | sed 's/.* kernel:/&  /' | awk '{$1=$2=$4="";$3=$3" |";$5=$5" | ";$6=$6" | ";print}' | awk -F\| 'BEGIN {OFS="|"} {gsub(/[0-9.:{}(),-]+/,"",$4);print}' | awk '{$1=$1" | ";$2=$2" | ";$3=$3" | ";print}' > $OUTFILE
egrep -v '[^a-zA-Z]\+|httpd|VERSION|datakeg|rsyslogd' $FILE | sed 's/.* kernel:/&  /' | awk '{$1=$2=$4="";$3=$3" |";$5=$5" | ";$6=$6" | ";print}' | sed 's/^[ ]*//' | awk -F\| 'BEGIN {OFS="|"} {gsub(/[0-9.:{}(),-]+/,"",$4);print}' > $OUTFILE

[[ $? -ne 0 ]] && exit 3

echo "extracted ${FILE} and wrote ${OUTFILE}.."
exit 0
