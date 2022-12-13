#!/bin/bash

./request_websites_no_cache.sh 1 &
./request_websites_no_cache.sh 2 &
./request_websites_no_cache.sh 3 &

wait
