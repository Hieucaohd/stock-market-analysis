from typing import Type
from airflow import DAG
from airflow.decorators import task
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator

class Operator:

    def __init__(
            self
        ):
        pass

    
    def create_table(self):

        return SparkSubmitOperator(
            py_files="./create_table.py",
            task_id="create_table",
            master="spark://spark-master:7077"
        )
    
    