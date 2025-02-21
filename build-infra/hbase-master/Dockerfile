FROM caotrunghieu192/base-hbase:latest

USER root

EXPOSE 16010 16000 9090 9095

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
