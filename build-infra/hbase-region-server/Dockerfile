FROM caotrunghieu192/base-hbase:latest

USER root

EXPOSE 16030 16020

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
