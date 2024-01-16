from pyspark.sql import SparkSession
from os.path import abspath
import time

spark: SparkSession = SparkSession \
    	.builder \
        .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
        .enableHiveSupport() \
        .getOrCreate()
        
sc = spark.sparkContext

# spark.sql("create table flight (DEST_COUNTRY_NAME string,ORIGIN_COUNTRY_NAME string,count int) row format delimited fields terminated by ',' lines terminated by '\n'  stored as textfile;")
# spark.sql("create table flight (DEST_COUNTRY_NAME string,ORIGIN_COUNTRY_NAME string,count int) using csv;")
# spark.sql("create table flight2 (DEST_COUNTRY_NAME string,ORIGIN_COUNTRY_NAME string,count int) using json;")
# spark.sql("create table flight3 (DEST_COUNTRY_NAME string,ORIGIN_COUNTRY_NAME string,count STRUCT<name: INT>) using json;")
# spark.sql("drop table flight;")
# spark.sql("use default;")
# spark.sql("show tables;").show()
# spark.sql("select count.name from flight3;").show()
