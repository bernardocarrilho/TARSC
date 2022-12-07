#!/bin/bash

python3 import_websites.py $1

file="websites.txt"
folder=1

while read -r line; do
    mkdir $folder
    wget --tries=3 $line
    mv index.html $folder/
    let folder++
done <$file
