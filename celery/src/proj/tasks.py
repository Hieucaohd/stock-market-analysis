from .celery import app, Task
import redis
import logging
import pandas as pd
import sqlite3
import pickle
import numpy as np
from typing import List
import random
import time
import redis
import os
from .logs.logging import get_logger


logger = get_logger(__name__)


@app.task
def add(x, y):
    logger.info(f"Hello from {x + y}")
    return x + y

@app.task
def abc(ax):
    return ax
