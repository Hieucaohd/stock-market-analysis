FROM caotrunghieu192/base-kafka:latest

USER root

ADD run_kafka.sh /run_kafka.sh
RUN chmod a+x /run_kafka.sh

CMD [ "/run_kafka.sh" ]
