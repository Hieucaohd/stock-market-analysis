import logging
import os

logger = logging.getLogger("cloudlogger")
logger.setLevel(os.getenv('AIRFLOW__CORE__LOGGING_LEVEL', logging.INFO))
