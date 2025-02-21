FROM caotrunghieu192/base-kali-java:latest

USER root

ENV HBASE_VERSION 2.5.10
ENV HBASE_URL https://dlcdn.apache.org/hbase/stable/hbase-${HBASE_VERSION}-bin.tar.gz

RUN set -x \
	&& wget ${HBASE_URL} -O /tmp/hbase.tar.gz \
	&& tar -xvf /tmp/hbase.tar.gz -C /opt/ \
	&& rm /tmp/hbase.tar.gz* 

ENV HBASE_HOME=/opt/hbase-${HBASE_VERSION}
ENV PATH ${HBASE_HOME}/bin/:$PATH
