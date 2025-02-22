FROM caotrunghieu192/base-kali-java:latest

USER root

ENV HADOOP_VERSION=3.3.6
ENV HADOOP_URL=https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

RUN set -x \
	&& wget ${HADOOP_URL} -O /tmp/hadoop.tar.gz \
	&& tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
	&& mv /opt/hadoop-${HADOOP_VERSION} /opt/hadoop_home \
	&& rm /tmp/hadoop.tar.gz* 

ENV HADOOP_HOME=/opt/hadoop_home

RUN ln -s ${HADOOP_HOME}/etc/hadoop /etc/hadoop

RUN mkdir ${HADOOP_HOME}/logs 

RUN mkdir /hadoop-data 


ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV PATH=${HADOOP_HOME}/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
