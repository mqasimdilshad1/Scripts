#!/bin/bash

file="$1"
folder="$2"

if [ -z "$file" ] || [ -z "$folder" ]; then
  echo "give arguments for file searching: <file> <folder>"
  exit 1
fi

function search_recursive() {
  local dir="$1"

  for entry in "$dir"/*; do
    if [ -f "$entry" ]; then
      if [ "$(basename "$entry")" = "$file" ]; then
        echo "Found $file in: $entry"
      fi
    elif [ -d "$entry" ]; then
      search_recursive "$entry"
    fi
  done
}
search_recursive "$folder"
echo "Search complete."






