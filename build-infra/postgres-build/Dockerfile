FROM postgres:11-alpine

COPY hive-schema-3.1.0.postgres.sql /hive/hive-schema-3.1.0.postgres.sql

COPY init-hive-db.sh /init-hive-db.sh
RUN chmod +x /init-hive-db.sh 
