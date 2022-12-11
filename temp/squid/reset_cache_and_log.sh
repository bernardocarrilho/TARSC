#!/bin/bash

sudo ./stop_squid.sh

# Delete Cache
sudo rm -rf /var/spool/squid/
sudo mkdir /var/spool/squid/
sudo chown proxy:proxy /var/spool/squid/
sudo squid -z

# Delete Log
sudo rm /var/log/squid/access.log

sudo ./start_squid.sh
