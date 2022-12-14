#!/bin/bash

# Setup Bridge
sudo ip link add br0 type bridge
sudo ip link set dev br0 up
sudo ip addr add 192.168.1.100/24 dev br0


# Setup Namespaces
for n in {1..9}; 
do
    sudo ip netns add ws$n
    sudo ip link add veth-ws$n type veth peer name veth-br0-ws$n
    sudo ip link set veth-ws$n netns ws$n
    sudo ip netns exec ws$n ip addr add 192.168.1.10$n dev veth-ws$n
    sudo ip netns exec ws$n ip link set veth-ws$n up
    sudo ip link set veth-br0-ws$n master br0
    sudo ip link set veth-br0-ws$n up
    sudo ip netns exec ws$n ip route add default via 192.168.1.10$n dev veth-ws$n
done

sudo ip netns add ws10
sudo ip link add veth-ws10 type veth peer name veth-br0-ws10
sudo ip link set veth-ws10 netns ws10
sudo ip netns exec ws10 ip addr add 192.168.1.110 dev veth-ws10
sudo ip netns exec ws10 ip link set veth-ws10 up
sudo ip link set veth-br0-ws10 master br0
sudo ip link set veth-br0-ws10 up
sudo ip netns exec ws10 ip route add default via 192.168.1.110 dev veth-ws10


# Set Delays
## Add Simple Delay
#sudo tc qdisc add dev eth0 root netem delay 100ms
## Add Delay with Variability
sudo tc qdisc add dev veth-br0-ws1 root netem delay 19.890ms 0.778ms
sudo tc qdisc add dev veth-br0-ws2 root netem delay 19.937ms 0.660ms
sudo tc qdisc add dev veth-br0-ws3 root netem delay 145.145ms 30.367ms
sudo tc qdisc add dev veth-br0-ws4 root netem delay 179.132ms 13.756ms
sudo tc qdisc add dev veth-br0-ws5 root netem delay 34.046ms 2.223ms
sudo tc qdisc add dev veth-br0-ws6 root netem delay 225.656ms 38.514ms
sudo tc qdisc add dev veth-br0-ws7 root netem delay 11.771ms 0.946ms
sudo tc qdisc add dev veth-br0-ws8 root netem delay 11.498ms 1.172ms
sudo tc qdisc add dev veth-br0-ws9 root netem delay 11.996ms 1.252ms
sudo tc qdisc add dev veth-br0-ws10 root netem delay 171.547ms 33.674ms
## Add Delay with Correlation
#sudo tc qdisc change dev eth0 root netem delay 100ms 10ms 25%
## Add Delay Distribution
#sudo tc qdisc change dev eth0 root netem delay 100ms 20ms distribution normal
## Add Packet Loss
#sudo tc qdisc change dev eth0 root netem loss 0.1%
## Add Packet Loss with Correlation
#sudo tc qdisc change dev eth0 root netem loss 0.3% 25%
