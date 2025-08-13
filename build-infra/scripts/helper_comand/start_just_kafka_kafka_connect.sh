#!/bin/bash

cd "$(dirname $0)/../../"

docker-compose start zoo1 zoo2 zoo3 kafka-1 kafka-2 kafka-3 kafka-connect-1 kafka-connect-2 kafka-connect-3

