#!/bin/bash

setEnv() {
	. .env
}

prepareEnvFile() {
	if [ ! -f .env ]; then
		cp build-infra/.env.tmpl .env
		echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" >> .env
	fi
}

prepareConfig() {
	config_folder="config"
	hadoop_config="hadoop"
	hive_config="hive"
	spark_config="spark"

	if [ ! -d "$config_folder/$hadoop_config" ]; then
		echo "Folder $config_folder/$hadoop_config does not exist."
		cp -r "$config_folder/template/$hadoop_config" "$config_folder/$hadoop_config"
	else
		echo "Folder $config_folder/$hadoop_config already exists."
	fi

	if [ ! -d "$config_folder/$hive_config" ]; then
		echo "Folder $config_folder/$hive_config does not exist."
		cp -r "$config_folder/template/$hive_config" "$config_folder/$hive_config"
	else
		echo "Folder $config_folder/$hive_config already exists."
	fi

	if [ ! -d "$config_folder/$spark_config" ]; then
		echo "Folder $config_folder/$spark_config does not exist."
		cp -r "$config_folder/template/$spark_config" "$config_folder/$spark_config"
	else
		echo "Folder $config_folder/$spark_config already exists."
	fi
}

main() {
	set -e
	cd "$(dirname $0)/../../"

	prepareEnvFile
	setEnv
	prepareConfig
}

main "$@"
