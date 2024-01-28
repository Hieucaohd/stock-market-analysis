#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
from __future__ import annotations

import typing

import pendulum


import pandas as pd
from pyspark import SparkContext
from pyspark.sql import SparkSession

from airflow.decorators import dag, task


@dag(
    schedule=None,
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example"],
)
def example_pyspark():
    """
    ### Example Pyspark DAG
    This is an example DAG which uses pyspark
    """

    # [START task_pyspark]
    @task.pyspark(conn_id="spark://172.30.0.2:7077")
    def spark_task(spark: SparkSession, sc: SparkContext) -> pd.DataFrame:
        spark: SparkSession = SparkSession \
            .builder \
            .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
            .enableHiveSupport() \
            .getOrCreate()
        df = spark.sql("select * from flight;")
        df.show()
        return df.toPandas()

    # [END task_pyspark]

    @task
    def print_df(df: pd.DataFrame):
        print(df)

    df = spark_task()
    print_df(df)


# work around pre-commit
dag = example_pyspark()  # type: ignore

