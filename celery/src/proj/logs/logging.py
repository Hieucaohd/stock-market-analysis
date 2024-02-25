import logging
import os


def get_logger(file):
    logger = logging.getLogger(file)
    logger.setLevel(os.environ.get('LOGGER_LEVEL', logging.INFO))
    return logger
