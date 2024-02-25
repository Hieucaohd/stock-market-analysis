FROM caotrunghieu192/base-kali-java:latest

USER root

RUN mkdir -p /home/celery/bin/
RUN mkdir -p /home/celery/log/
RUN mkdir -p /home/celery/run/

COPY ./requirements.txt /home/celery/base-requirements.txt

RUN pip install -U Celery==5.3.6
RUN pip install -U watchdog[watchmedo]==4.0.0
RUN pip install -r /home/celery/base-requirements.txt

ADD run_worker.sh /home/celery/bin/run_worker.sh
RUN chmod a+x /home/celery/bin/run_worker.sh

CMD [ "/home/celery/bin/run_worker.sh" ]
