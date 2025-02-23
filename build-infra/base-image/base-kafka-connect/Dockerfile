FROM caotrunghieu192/base-kali-java-17:latest

USER root

ENV KAFKA_VERSION=3.6.1
ENV KAFKA_VERSION_PREFIX=2.13
ENV KAFKA_URL=https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${KAFKA_VERSION_PREFIX}-${KAFKA_VERSION}.tgz

RUN set -x \
	&& wget ${KAFKA_URL} -O /tmp/kafka.tgz \
	&& tar -xvf /tmp/kafka.tgz -C /opt/ \
	&& mv /opt/kafka_${KAFKA_VERSION_PREFIX}-${KAFKA_VERSION} /opt/kafka_home \
	&& rm /tmp/kafka.tgz* 

ENV KAFKA_HOME=/opt/kafka_home
ENV PATH=${KAFKA_HOME}/bin/:$PATH

EXPOSE 9092
