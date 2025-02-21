FROM kalilinux/kali-rolling:amd64

USER root

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
