#!/bin/bash

timestamp=$(date +"%H:%M:%S")
new_ps1="\[${timestamp}\] >"

current_ps1="$PS1"

PS1="$new_ps1"

dotfile_path="$HOME/.dotfile"
if [ -e "$dotfile_path" ]; then
  source "$dotfile_path"
fi

# Display a message with the updated PS1
echo "Temporary PS1 set to: $PS1"

# Restore the original PS1
PS1="$current_ps1"
