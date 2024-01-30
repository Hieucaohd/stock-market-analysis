FROM kalilinux/kali-rolling:amd64

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	net-tools \
	curl \
	netcat-traditional \
	gnupg \
	libsnappy-dev \
	wget \
	python3 \
	pip \
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

ENV HADOOP_VERSION 3.3.6
ENV HADOOP_URL https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

RUN set -x \
	&& wget ${HADOOP_URL} -O /tmp/hadoop.tar.gz \
	&& tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
	&& rm /tmp/hadoop.tar.gz* 

RUN ln -s /opt/hadoop-${HADOOP_VERSION}/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-${HADOOP_VERSION}/logs 

RUN mkdir /hadoop-data 

ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV PATH ${HADOOP_HOME}/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
