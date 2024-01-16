FROM stock-market-analysis/base-hdfs:latest

USER root

ENV HIVE_VERSION=3.1.3
ENV HIVE_URL=https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz

WORKDIR /opt

RUN wget ${HIVE_URL} \
	&& tar -xzvf apache-hive-${HIVE_VERSION}-bin.tar.gz \
	&& mv apache-hive-${HIVE_VERSION}-bin hive \
	&& wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O /opt/hive/lib/postgresql-jdbc.jar \
	&& rm apache-hive-${HIVE_VERSION}-bin.tar.gz \
	&& rm -rf /var/lib/apt/lists/*

ENV HIVE_HOME=/opt/hive
ENV PATH=${HIVE_HOME}/bin:${PATH}

EXPOSE 10000
EXPOSE 10002
