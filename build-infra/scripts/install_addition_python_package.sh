#!/usr/bin/env bash

setEnv() {
  . .env
}

startContainers() {
  docker-compose start postgres redis airflow-scheduler airflow-worker airflow-triggerer airflow-cli flower;
}

stopContainers() {
  docker-compose stop postgres redis airflow-scheduler airflow-worker airflow-triggerer airflow-cli flower;
}

installPythonPackage() {

	docker-compose cp ./build-infra/airflow/requirements.txt airflow-scheduler:/opt/airflow/requirements.txt;
	docker-compose cp ./build-infra/airflow/requirements.txt airflow-worker:/opt/airflow/requirements.txt;
	docker-compose cp ./build-infra/airflow/requirements.txt airflow-triggerer:/opt/airflow/requirements.txt;
	docker-compose cp ./build-infra/airflow/requirements.txt airflow-cli:/opt/airflow/requirements.txt;
	docker-compose cp ./build-infra/airflow/requirements.txt flower:/opt/airflow/requirements.txt;

	docker-compose exec -T -u ${AIRFLOW_UID} airflow-scheduler pip install --force-reinstall -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
    ;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-workerpip install --force-reinstall -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-triggererpip install --force-reinstall -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-clipip install --force-reinstall -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	docker-compose exec -T -u ${AIRFLOW_UID} flowerpip install --force-reinstall -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
}


main() {
	set -e
	cd "$(dirname $0)/../../"
	setEnv
	startContainers
	installPythonPackage
	# stopContainers
}

main
