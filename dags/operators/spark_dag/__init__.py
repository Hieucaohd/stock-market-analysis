from typing import Type
from airflow import DAG
from airflow.decorators import task
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
import importlib

import os
import sys
from dags.common.logs.logging import logger


class Operator:

    def __init__(
            self,
            dag: Type[DAG]
        ):
        self.dag = dag
    
    def create_table(self):
        import dags.operators.spark_dag.create_table_batch as create_table_batch
        
        return SparkSubmitOperator(
            application=create_table_batch.__file__,
            task_id="create_table_batch",
            dag=self.dag,
            driver_memory="12G",
            deploy_mode="client",
            name="create_table_batch"
        )
    