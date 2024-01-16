from pyspark.sql import SparkSession
from os.path import abspath
import time

spark: SparkSession = SparkSession \
    	.builder \
        .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
        .enableHiveSupport() \
        .getOrCreate()
        
sc = spark.sparkContext

spark.sql("create table flight (DEST_COUNTRY_NAME string, ORIGIN_COUNTRY_NAME string, count int) using csv;")

