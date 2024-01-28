
FROM apache/airflow:2.6.3-python3.8

ARG AIRFLOW_UID_OVERWRITE
ARG AIRFLOW_GID_OVERWRITE

COPY ./base-requirements.txt /opt/airflow/base-requirements.txt

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

## setup permssion of soruce files for airflow. 
RUN (groupmod --gid "${AIRFLOW_GID_OVERWRITE}" airflow || true) \
    && usermod --uid "${AIRFLOW_UID_OVERWRITE}" airflow \
    && chown "${AIRFLOW_UID_OVERWRITE}:${AIRFLOW_GID_OVERWRITE}" /entrypoint \
    && chown "${AIRFLOW_UID_OVERWRITE}:${AIRFLOW_GID_OVERWRITE}" -R /opt/airflow \
    && chown "${AIRFLOW_UID_OVERWRITE}:${AIRFLOW_GID_OVERWRITE}" -R /home/airflow \
    ;

## install libraries and pypi packages preinstalled in the composer airflow.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 467B942D3A79BD29 \
    && apt-get update \
    # && apt-get upgrade -y \
    && apt-get install -y \
        build-essential \
        default-libmysqlclient-dev \
        pkg-config \
        ;

# Must install package by airflow user
USER ${AIRFLOW_UID_OVERWRITE}

RUN pip install --force-reinstall -r /opt/airflow/base-requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
        ;

USER root

RUN apt-get purge -y --auto-remove \
        build-essential \
        default-libmysqlclient-dev \
        pkg-config \
        ;

ENV C_FORCE_ROOT=true

USER airflow
