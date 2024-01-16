export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-`hostname`}
spark-submit --deploy-mode client --master spark://${SPARK_MASTER_HOST}:7077 $1