#!/bin/bash

cd /home/celery/src/

watchmedo auto-restart --directory=/home/celery/src/ --pattern=*.py --recursive -- celery -A proj worker -E -l INFO \
	--pidfile=/home/celery/run/%n.pid \
	--logfile=/home/celery/log/%n%I.log
