from .celery import app, Task
from .logs.logging import get_logger
import redis
import pandas as pd
import sqlite3
import pickle
import numpy as np
from typing import List
import random
import time
import os


logger = get_logger(__name__)


@app.task(bind=True)
def add(self, x, y):
    logger.info(f"Hello from {x + y}")
    return x + y


# @app.task(bind=True)
# def 


@app.task(bind=True)
def abc(self, ax):
    return ax
