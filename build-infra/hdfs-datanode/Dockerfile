FROM caotrunghieu192/base-hdfs:latest

RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864

CMD [ "/run.sh" ]
