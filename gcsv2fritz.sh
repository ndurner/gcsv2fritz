#!/bin/bash

if test -z "$(which iconv)"; then
	echo iconv not found
	exit
fi

if test -z "$(which awk)"; then
	echo awk not found
	exit
fi

if test -z "$1" -o -z "$2"; then
	echo "Usage: $0 google.csv FRITZ.Box_Telefonbuch_20.xml"
	exit
fi

iconv -f unicode -t utf8 $1 | sort | awk -F , -f gcsv2fritz.awk > $2
if test $? -eq 0; then
	echo "</phonebook></phonebooks>" >> $2
fi
