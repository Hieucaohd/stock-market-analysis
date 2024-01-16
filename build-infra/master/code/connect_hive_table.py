from pyspark.sql import SparkSession
from os.path import abspath
import time

spark: SparkSession = SparkSession \
    	.builder \
        .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
        .config("spark.sql.warehouse.dir", "/user/hive/warehouse") \
        .enableHiveSupport() \
        .getOrCreate()
        
sc = spark.sparkContext

spark.sql("select * from logs2").show()
