#!/bin/bash

cd "$(dirname $0)/../../"

docker-compose stop

docker rm stock-market-analysis-namenode
docker rm stock-market-analysis-namenode-1
docker rm stock-market-analysis-datanode

docker image rm stock-market-analysis_namenode
docker image rm stock-market-analysis_namenode-1
docker image rm stock-market-analysis_datanode

docker volume rm stock-market-analysis_stock-market-analysis-hadoop-namenode
docker volume rm stock-market-analysis_stock-market-analysis-hadoop-namenode-1
docker volume rm stock-market-analysis_stock-market-analysis-hadoop-datanode


docker-compose up -d namenode datanode

