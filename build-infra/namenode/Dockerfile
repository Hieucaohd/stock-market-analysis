FROM caotrunghieu192/base-hdfs:latest

RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD [ "/run.sh" ]
