#!/bin/bash

[[ $# -ne 1 ]] && echo "input file not given; argc == $#" &&  exit 1

FILE=$1
OUTFILE="npm_noh.txt"

[[ ! -f $FILE ]] && echo "$FILE doesn't exist" && exit 2

cat $FILE | tr '\t' ';' | cut -d\; -f4- > $OUTFILE

[[ $? -ne 0 ]] && exit 3

echo "extracted ${FILE} and wrote ${OUTFILE}.."
exit 0
