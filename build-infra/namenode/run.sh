#!/bin/bash

file_path="/hadoop/dfs/name/current/VERSION"

if [ -e "$file_path" ]; then
  echo "File exists: $file_path"
else
  echo "File does not exist: $file_path"
  $HADOOP_HOME/bin/hdfs namenode -format
fi

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
