FROM kalilinux/kali-rolling:amd64

USER root

COPY ./java_jdk/jdk-17.0.12_linux-x64_bin.tar.gz /tmp/jdk-17.0.12_linux-x64_bin.tar.gz
RUN mkdir /usr/lib/jvm/ \ 
	&& tar -xvzf /tmp/jdk-17.0.12_linux-x64_bin.tar.gz -C /usr/lib/jvm/ \
    && rm -f /tmp/jdk-17.0.12_linux-x64_bin.tar.gz

ENV PATH /usr/lib/jvm/jdk-17.0.12/bin:/usr/lib/jvm/jdk-17.0.12/db/bin:/usr/lib/jvm/jdk-17.0.12/jre/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/jdk-17.0.12

RUN update-alternatives --install  "/usr/bin/java" "java" "/usr/lib/jvm/jdk-17.0.12/bin/java" 0 \
	&& update-alternatives --install  "/usr/bin/java" "java" "/usr/lib/jvm/jdk-17.0.12/bin/javac" 0 \
	&& update-alternatives --set java /usr/lib/jvm/jdk-17.0.12/bin/java \
	&& update-alternatives --set java /usr/lib/jvm/jdk-17.0.12/bin/javac

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
