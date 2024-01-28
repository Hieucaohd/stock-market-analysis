import sys
import os

current_dir = os.path.abspath(os.path.dirname(__file__))
sys.path.append(os.path.abspath(os.path.join(current_dir, ".."))) 


import json
import pendulum
from airflow import DAG
from dags.operators.spark_dag import Operator


with DAG(
    schedule=None,
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example"],
    dag_id="spark_dag"
) as dag:
    op = Operator(dag)
    op.create_table()
