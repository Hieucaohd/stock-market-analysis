#!/usr/bin/env bash

setEnv() {
  . .env
}

startContainers() {
  docker-compose up -d postgres redis airflow-worker;
}

stopContainers() {
  docker-compose stop postgres redis airflow-worker;
}

initializeAirflowDb() {
  echo 'Initializing airflow...'
  docker-compose exec -T -u ${AIRFLOW_UID} airflow-worker airflow db init;
  docker-compose exec -T -u ${AIRFLOW_UID} airflow-worker airflow variables import /opt/airflow/variables.json;
}

initializeMetastoreDB() {
  	cd "$(dirname $0)/../../" || exist

	docker-compose exec -T postgres /init-hive-db.sh;
}

main() {
	set -e
	setEnv
	startContainers
	initializeAirflowDb
	# initializeMetastoreDB
	stopContainers
}

main
