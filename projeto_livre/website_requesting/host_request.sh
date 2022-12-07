#!/bin/bash

for (( i=1 ; i<=$1 ; i++ )); 
do
    curl 10.0.0.2/$i/index.html
done
