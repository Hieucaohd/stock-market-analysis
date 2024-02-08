FROM caotrunghieu192/base-kali-java:latest

USER root

ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3
ENV SPARK_URL https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN set -x \
	&& wget ${SPARK_URL} -O /tmp/spark.tgz \
	&& tar -xvzf /tmp/spark.tgz -C / \
	&& mv /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark \
	&& rm /tmp/spark.tgz* 

ENV SPARK_HOME=/spark
ENV PYTHONHASHSEED=1
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV PATH=${SPARK_HOME}/bin/:${SPARK_HOME}/sbin/:${PATH}

