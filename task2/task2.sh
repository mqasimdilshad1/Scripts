#!/bin/bash

echo "Creating folder task2"
mkdir -p task2

echo "Creating three files in task2"
touch task2/f1
touch task2/f2
touch task2/f3

echo "Creating task2_temp folder" 
mkdir -p task2_temp

echo "copying files in task2_temp"
cp -r task2/* task2_temp/

echo "folder names swapping"
mv task2 task2_p
mv task2_temp task2
mv task2_p task2_temp

echo "completed"



