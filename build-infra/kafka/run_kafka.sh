#!/bin/bash

# # Kiểm tra xem biến môi trường BROKER_ID đã được đặt chưa
# if [ -z "$BROKER_ID" ]; then
#   echo "Error: BROKER_ID chưa được đặt. Vui lòng đặt biến môi trường trước khi chạy script."
#   exit 1
# fi

# # Đường dẫn đến file cấu hình Kafka
# CONFIG_FILE="$KAFKA_HOME/config/server.properties"

# # Kiểm tra file có tồn tại không
# if [ ! -f "$CONFIG_FILE" ]; then
#   echo "Error: File $CONFIG_FILE không tồn tại!"
#   exit 1
# fi

# # Thay thế giá trị của broker.id bằng biến môi trường BROKER_ID
# sed -i "s/^broker.id=.*/broker.id=$BROKER_ID/" "$CONFIG_FILE"

# echo "Đã cập nhật broker.id thành $BROKER_ID trong $CONFIG_FILE"


# while true; do
#     echo "Looping forever..."
#     sleep 1  # Tạm dừng 1 giây để tránh quá tải CPU
# done


$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server_$BROKER_ID.properties
