#!/bin/bash

file="request_list_$1.txt"

while read -r line; do
    if [ $line == 10 ]; then
        curl -x 127.0.0.1:3128 192.168.1.110:80/10/index.html
    else
        curl -x 127.0.0.1:3128 192.168.1.10$line:80/$line/index.html
    fi
done <$file
