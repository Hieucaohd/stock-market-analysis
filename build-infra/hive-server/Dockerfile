FROM caotrunghieu192/base-hive:latest


COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

RUN hdfs dfs -mkdir -p    /tmp
RUN hdfs dfs -mkdir -p    /user/hive/warehouse
RUN hdfs dfs -chmod g+w   /tmp
RUN hdfs dfs -chmod g+w   /user/hive/warehouse

CMD startup.sh
