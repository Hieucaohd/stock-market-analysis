from typing import Type
from airflow import DAG
from airflow.decorators import task
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator

class Operator:

    dag = None
    op_module = None

    def __init__(
            self,
            op_module
        ):
        self.op_module=op_module

    
    def data_export_to_elasticsearch(self):

        @task(task_id="data_export_to_elasticsearch_batch")
        def execute(**kwargs):
            return self.op_module.data_export_to_elasticsearch_batch(**kwargs)
        
        return execute()
    
    