#!/bin/bash

file="request_list_$1.txt"
rm $file

RANDOM=$(date +%s%N | cut -b10-19)
for (( i=1 ; i<=$2 ; i++ )); 
do
    echo $(( $RANDOM % 10 + 1 )) >> $file
done
