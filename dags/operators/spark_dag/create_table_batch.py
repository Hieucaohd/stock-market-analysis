from pyspark.sql import SparkSession
from os.path import abspath
import time


spark: SparkSession = SparkSession \
    	.builder \
        .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
        .config("spark.sql.warehouse.dir", "/user/spark/spark-warehouse") \
        .enableHiveSupport() \
        .getOrCreate()
        
sc = spark.sparkContext

log4jLogger = sc._jvm.org.apache.log4j
LOGGER = log4jLogger.LogManager.getLogger(__name__)

spark.sql("select * from flight;").show()
