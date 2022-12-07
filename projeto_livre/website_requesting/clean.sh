#!/bin/bash

file="websites.txt"
folder=1

while read -r line; do
    rm -r $folder
    let folder++
done <$file

rm websites.txt
