#!/bin/bash

# Script to clean SH messages file before NLP process.
# It takes one input: messages files name.
# It outputs a cleaned filed by removing month and day, hostname 
# as well as non alphabet sequences.
#

[[ $# -ne 1 ]] && echo "input file not given; argc == $#" &&  exit 1

FILE=$1
OUTFILE="sh_msg.txt"

[[ ! -f $FILE ]] && echo "$FILE doesn't exist" && exit 2

egrep -v '[^a-zA-z]\+' $FILE | awk '{$1=$2=$4="";$3=$3" |";$5=$5" | ";$6=$6" | ";print}' | awk -F\| '{gsub(/[0-9.:{}(),-]+/,"",$4);print}' | awk '{$1=$1" | ";$2=$2" | ";$3=$3" | ";print}' > $OUTFILE

[[ $? -ne 0 ]] && exit 3

echo "extracted ${FILE} and wrote ${OUTFILE}.."
exit 0
