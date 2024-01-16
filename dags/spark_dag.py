
import json

import pendulum

from airflow.decorators import dag, task
from operators.spark_dag import Operator

@dag(
    schedule=None,
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example"],
)
def spark_dag():

    op = Operator()
    op.create_table()

spark_dag()
