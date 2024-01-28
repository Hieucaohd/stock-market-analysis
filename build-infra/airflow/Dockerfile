FROM caotrunghieu192/base-airflow:latest

COPY ./requirements.txt /opt/airflow/requirements.txt
COPY ./variables.json /opt/airflow/variables.json

USER root


RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	net-tools \
	curl \
	netcat-traditional \
	gnupg \
	libsnappy-dev \
	python3 \
	pip \
	wget \
    && rm -rf /var/lib/apt/lists/*

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


RUN apt-get update \
    # && apt-get upgrade -y \
    && apt-get install -y \
        build-essential \
        ;

# Must install package by airflow user
USER airflow

RUN pip install -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
        ;

USER root

RUN apt-get purge -y --auto-remove \
        build-essential \
    ;

USER airflow
