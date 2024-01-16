FROM stock-market-analysis/base-airflow:latest

COPY ./requirements.txt /opt/airflow/requirements.txt
COPY ./variables.json /opt/airflow/variables.json

USER root

RUN apt-get update \
    # && apt-get upgrade -y \
    && apt-get install -y \
        build-essential \
        ;

# Must install package by airflow user
USER airflow

RUN pip install --force-reinstall -r /opt/airflow/requirements.txt \
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
