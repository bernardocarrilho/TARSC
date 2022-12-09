#!/bin/bash

file="request_list_$1.txt"

while read -r line; do
    curl 127.0.0.1:80/$line/index.html
done <$file
