from celery import Celery
from celery import Task
import os

app = Celery(
	'proj',
	broker=os.environ.get("BROKER", 'redis://redis:6379/0'),
	# backend='db+postgresql://celery:celery@localhost:5432/celery_backend',
	# backend='rpc://',
	include=['proj.tasks']
)

app.conf.update(
	result_expires=2
)

if __name__ == "__main__":
    app.start()
