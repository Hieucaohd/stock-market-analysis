FROM stock-market-analysis/base-hdfs:latest

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD [ "/run.sh" ]
