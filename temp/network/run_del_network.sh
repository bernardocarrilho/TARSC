#!/bin/bash

# Delete Bridge
sudo ip link delete br0

# Delete Namespaces
for n in {1..10}; 
do
    sudo ip link delete veth-br0-ws$n
    sudo ip netns delete ws$n
done
