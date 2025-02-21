FROM caotrunghieu192/base-kali-java:latest

USER root

ENV ZOOKEEPER_VERSION 3.8.4
ENV ZOOKEEPER_URL https://dlcdn.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

RUN set -x \
	&& wget ${ZOOKEEPER_URL} -O /tmp/zookeeper.tar.gz \
	&& tar -xvf /tmp/zookeeper.tar.gz -C /opt/ \
	&& rm /tmp/zookeeper.tar.gz* 

EXPOSE 2181 2888 3888

ENV ZOOKEEPER_HOME=/opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin
ENV ZOO_CONF_DIR=$ZOOKEEPER_HOME/conf
ENV ZOO_DATA_DIR=/var/lib/zookeeper
ENV PATH ${ZOOKEEPER_HOME}/bin/:$PATH
