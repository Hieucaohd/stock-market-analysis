#!/bin/bash


# while true; do
#     echo "Looping forever..."
#     sleep 1  # Tạm dừng 1 giây để tránh quá tải CPU
# done


connect-distributed.sh $KAFKA_HOME/config/connect-distributed.properties
