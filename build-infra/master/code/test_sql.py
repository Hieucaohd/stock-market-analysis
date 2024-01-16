from pyspark.sql import SparkSession
from os.path import abspath
import time

warehouse_location = abspath("/user/spark/warehouse")

print(warehouse_location)

spark: SparkSession = SparkSession \
    	.builder \
        .config("spark.sql.warehouse.dir", warehouse_location) \
        .enableHiveSupport() \
        .getOrCreate()
        # .config("hive.metastore.warehouse.dir", "/user/hive/warehouse") \
        
sc = spark.sparkContext

# spark.sql("create table flight (DEST_COUNTRY_NAME string,ORIGIN_COUNTRY_NAME string,count int) using json;")
spark.sql("select * from flight;").show()
