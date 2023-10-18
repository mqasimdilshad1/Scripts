#!/bin/bash

border_char=""
string_to_print=""

while getopts ":s:c:" opt; do
  case $opt in
    s) string_to_print="$OPTARG" ;;
    c) border_char="$OPTARG" ;;
    \?) echo "Invalid option: -$OPTARG" >&2
        exit 1 ;;
  esac
done

string_length=${#string_to_print}

if [ "$border_char" != "" ]; then
  
  border=""
  for ((i=0; i<string_length+4; i++)); do
      border="$border $border_char"
  done


  echo "$border"

  echo "$border_char $string_to_print $border_char"

  echo "$border"
else
  echo "$string_to_print"
fi