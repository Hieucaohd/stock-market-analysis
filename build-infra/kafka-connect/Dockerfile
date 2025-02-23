FROM caotrunghieu192/base-kafka-connect:latest

USER root

ENV DEBEZIUM_URL=https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/3.0.6.Final/debezium-connector-mysql-3.0.6.Final-plugin.tar.gz

ENV KAFKA_CONNECT_HOME=/kafka/connect

RUN set -x \
	&& mkdir -p ${KAFKA_CONNECT_HOME}/plugins \
	&& wget ${DEBEZIUM_URL} -O /tmp/debezium.tar.gz \
	&& tar -xvf /tmp/debezium.tar.gz -C ${KAFKA_CONNECT_HOME}/plugins \
	&& rm /tmp/debezium.tar.gz* 

ADD run_kafka_connect.sh /run_kafka_connect.sh
RUN chmod a+x /run_kafka_connect.sh

CMD [ "/run_kafka_connect.sh" ]
