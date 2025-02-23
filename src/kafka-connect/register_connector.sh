#!/bin/bash

curl -X POST "http://localhost:8083/connectors" -H "Content-Type: application/json" -d '{
  "name": "inventory-db-change",  
  "config": {  
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",  
    "database.hostname": "mysql",  
    "database.port": "3306",
    "database.user": "root",
    "database.password": "mysql",
    "database.server.id": "1",  
    "topic.prefix": "dbserver1",  
    "database.include.list": "inventory",  
    "schema.history.internal.kafka.bootstrap.servers": "kafka-1:9092,kafka-2:9093,kafka-3:9094",  
    "schema.history.internal.kafka.topic": "schema-changes.inventory"  
  }
}'
