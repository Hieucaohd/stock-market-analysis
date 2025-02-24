#!/bin/bash

setEnv() {
	. .env
}

prepareEnvFile() {
	if [ ! -f .env ]; then
		echo "File .env does not exists."
		cp build-infra/.env.tmpl .env
		echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" >> .env
	else
		echo "File .env already exists."
	fi
}

prepareDockerCompose() {
	if [ ! -f docker-compose.yml ]; then
		echo "File docker-compose.yml does not exists."
		cp build-infra/docker-compose.tmpl.yml docker-compose.yml
	else
		echo "File docker-compose.yml already exists."
	fi
}

prepareConfig() {
	config_folder="config"
	hadoop_config="hadoop"
	hive_config="hive"
	spark_config="spark"
	kafka_config="kafka"
	zookeeper_config="zookeeper"
	hbase_config="hbase"

	if [ ! -d "$config_folder/$hadoop_config" ]; then
		echo "Folder $config_folder/$hadoop_config does not exists."
		cp -r "$config_folder/template/$hadoop_config" "$config_folder/$hadoop_config"
	else
		echo "Folder $config_folder/$hadoop_config already exists."
	fi

	if [ ! -d "$config_folder/$hive_config" ]; then
		echo "Folder $config_folder/$hive_config does not exists."
		cp -r "$config_folder/template/$hive_config" "$config_folder/$hive_config"
	else
		echo "Folder $config_folder/$hive_config already exists."
	fi

	if [ ! -d "$config_folder/$spark_config" ]; then
		echo "Folder $config_folder/$spark_config does not exist."
		cp -r "$config_folder/template/$spark_config" "$config_folder/$spark_config"

		for file in "$config_folder/$spark_config"/*.template; do
			[ -e "$file" ] || continue
			new_name="${file%.template}"
			mv "$file" "$new_name"
		done
	else
		echo "Folder $config_folder/$spark_config already exists."
	fi

	if [ ! -d "$config_folder/$kafka_config" ]; then
		echo "Folder $config_folder/$kafka_config does not exists."
		cp -r "$config_folder/template/$kafka_config" "$config_folder/$kafka_config"
	else
		echo "Folder $config_folder/$kafka_config already exists."
	fi
	
	if [ ! -d "$config_folder/$zookeeper_config" ]; then
		echo "Folder $config_folder/$zookeeper_config does not exists."
		cp -r "$config_folder/template/$zookeeper_config" "$config_folder/$zookeeper_config"
	else
		echo "Folder $config_folder/$zookeeper_config already exists."
	fi

	if [ ! -d "$config_folder/$hbase_config" ]; then
		echo "Folder $config_folder/$hbase_config does not exists."
		cp -r "$config_folder/template/$hbase_config" "$config_folder/$hbase_config"
	else
		echo "Folder $config_folder/$hbase_config already exists."
	fi
}

main() {
	set -e
	cd "$(dirname $0)/../../../"

	prepareEnvFile
	setEnv
	prepareConfig
	prepareDockerCompose
}

main "$@"
