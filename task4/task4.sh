#!/bin/bash

dotfile=".dotfile"      

if [ -f $dotfile ]; then
    echo "Dot file exists"
    cat ~/.dotfile >> ~/.bashrc
fi


