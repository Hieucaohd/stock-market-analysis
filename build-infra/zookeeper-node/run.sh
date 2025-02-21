#!/bin/bash

# Giá trị cần ghi vào file
VALUE=$ZOO_MY_ID

# Đường dẫn thư mục và file
DIR="/var/lib/zookeeper"
FILE="$DIR/myid"

# Tạo thư mục nếu chưa tồn tại
mkdir -p "$DIR"

# Ghi giá trị vào file (nếu file đã có, ghi đè)
echo "$VALUE" > "$FILE"

# Kiểm tra kết quả
if [ -f "$FILE" ]; then
    echo "Đã ghi giá trị $VALUE vào $FILE"
else
    echo "Lỗi: Không thể tạo file $FILE"
    exit 1
fi

zkServer.sh start-foreground

# while true; do
#     echo "Looping forever..."
#     sleep 1  # Tạm dừng 1 giây để tránh quá tải CPU
# done

