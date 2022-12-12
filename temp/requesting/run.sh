#!/bin/bash

./request_websites.sh 1 &
./request_websites.sh 2 &
./request_websites.sh 3 &

wait
