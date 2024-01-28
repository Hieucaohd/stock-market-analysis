FROM kalilinux/kali-rolling:amd64

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

COPY ./java_jdk/jdk-8u391-linux-x64.tar /tmp/jdk-8u391-linux-x64.tar
RUN mkdir /usr/lib/jvm/ \ 
	&& tar -xvzf /tmp/jdk-8u391-linux-x64.tar -C /usr/lib/jvm/ \
    && rm -f /tmp/jdk-8u391-linux-x64.tar

ENV PATH /usr/lib/jvm/jdk1.8.0_391/bin:/usr/lib/jvm/jdk1.8.0_391/db/bin:/usr/lib/jvm/jdk1.8.0_391/jre/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/jdk1.8.0_391

RUN update-alternatives --install  "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_391/bin/java" 0 \
	&& update-alternatives --install  "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_391/bin/javac" 0 \
	&& update-alternatives --set java /usr/lib/jvm/jdk1.8.0_391/bin/java \
	&& update-alternatives --set java /usr/lib/jvm/jdk1.8.0_391/bin/javac

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

