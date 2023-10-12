#!/bin/bash

text="$*"
text_length=${#text}


box_width=$((text_length + 4))

for ((i = 0; i < box_width; i++)); do
    echo -n "*"
done
echo

echo "* $text *"

for ((i = 0; i < box_width; i++)); do
    echo -n "*"
done
echo

