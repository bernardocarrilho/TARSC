#!/bin/bash

for n in {1..9}; 
do
    sudo ip netns exec ws$n python3 -m http.server --bind 192.168.1.10$n 80 &
done

sudo ip netns exec ws10 python3 -m http.server --bind 192.168.1.110 80 &
