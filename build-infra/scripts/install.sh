#!/usr/bin/env bash

setEnv() {
	. .env
}

prepareEnvFile() {
	if [ ! -f .env ]; then
		cp build/.env.tmpl .env
		echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" >> .env
	fi
}

createBaseImage() {
	docker image rm stock-market-analysis/base-hdfs:latest || true
	docker image rm stock-market-analysis/base-hive:latest || true
	docker image rm stock-market-analysis/base-spark:latest || true
	docker image rm stock-market-analysis/base-airflow:latest || true

	docker build ./build-infra/base-image/base-hdfs/ --force-rm --no-cache -t stock-market-analysis/base-hdfs:latest
	docker build ./build-infra/base-image/base-hive/ --force-rm --no-cache -t stock-market-analysis/base-hive:latest
	docker build ./build-infra/base-image/base-spark/ --force-rm --no-cache -t stock-market-analysis/base-spark:latest
	docker build ./build-infra/base-image/base-airflow/ \
		--force-rm \
		--no-cache \
		--build-arg AIRFLOW_UID_OVERWRITE="${AIRFLOW_UID}" \
		--build-arg AIRFLOW_GID_OVERWRITE="${AIRFLOW_GID}" \
		-t stock-market-analysis/base-airflow:latest

}

main() {
	set -e
	cd "$(dirname $0)/../../"

	prepareEnvFile
	setEnv
	createBaseImage
}

main
