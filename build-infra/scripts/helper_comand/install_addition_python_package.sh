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

	docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-airflow-scheduler:/opt/airflow/requirements.txt
	docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-airflow-worker:/opt/airflow/requirements.txt
	docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-airflow-triggerer:/opt/airflow/requirements.txt
	docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-airflow-webserver:/opt/airflow/requirements.txt
	# docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-airflow-cli:/opt/airflow/requirements.txt
	# docker cp ./build-infra/airflow/requirements.txt stock-market-analysis-flower:/opt/airflow/requirements.txt

	docker-compose exec -T -u ${AIRFLOW_UID} airflow-scheduler pip install -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
    ;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-worker pip install -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-triggerer pip install -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	docker-compose exec -T -u ${AIRFLOW_UID} airflow-webserver pip install -r /opt/airflow/requirements.txt \
        --no-cache-dir \
        --trusted-host pypi.python.org \
        --trusted-host files.pythonhosted.org \
        --trusted-host pypi.org \
	;
	# docker-compose exec -T -u ${AIRFLOW_UID} airflow-cli pip install -r /opt/airflow/requirements.txt \
        # --no-cache-dir \
        # --trusted-host pypi.python.org \
        # --trusted-host files.pythonhosted.org \
        # --trusted-host pypi.org \
	# ;
	# docker-compose exec -T -u ${AIRFLOW_UID} flower pip install -r /opt/airflow/requirements.txt \
        # --no-cache-dir \
        # --trusted-host pypi.python.org \
        # --trusted-host files.pythonhosted.org \
        # --trusted-host pypi.org \
	# ;
}


main() {
	set -e
	cd "$(dirname $0)/../../"
        pwd
	setEnv
	# startContainers
	installPythonPackage
	# stopContainers
}

main
