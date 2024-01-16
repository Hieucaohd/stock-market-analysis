export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-`hostname`}
spark-sql --master spark://${SPARK_MASTER_HOST}:7077