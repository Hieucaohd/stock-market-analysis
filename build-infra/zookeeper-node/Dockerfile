FROM caotrunghieu192/base-zookeeper:latest

USER root

EXPOSE 2181 2888 3888

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

