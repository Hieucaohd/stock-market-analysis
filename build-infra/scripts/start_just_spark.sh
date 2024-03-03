#!/bin/bash

cd "$(dirname $0)/../../"

docker-compose stop

docker-compose start namenode datanode spark-master resourcemanager nodemanager nodemanager-1 postgres hive-metastore 


