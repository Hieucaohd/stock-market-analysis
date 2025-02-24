#!/bin/bash

run_hdfs() {
	docker compose up -d --build namenode datanode-1 datanode-2 datanode-3
}

run_zookeeper() {
	docker compose up -d --build zoo-1 zoo-2 zoo3
}

run_yarn() {
	docker compose up -d --build yarn-resource-manager yarn-node-manager-1 yarn-node-manager-2 yarn-node-manager-3
}

run_spark() {
	docker compose up -d --build spark-master
}

run_hbase() {
	docker compose up -d --build hbase-master hbase-region-server-1 hbase-region-server-2 hbase-region-server-3
}

run_kafka() {
	docker compose up -d --build kafka-1 kafka-2 kafka-3
}

run_kafka_connect() {
	docker compose up -d --build kafka-connect-1 kafka-connect-2 kafka-connect-3
}

showUsage() {
	(
		cat << 'END'

Usage:
	./build-infra/scripts/install_project/run_services.sh <service_name> 

	service
		"hdfs" | "zookeeper" | "yarn" | "spark" | "hbase" | "kafka" | "kafka_connect"

Examples:
	./build-infra/scripts/install_project/run_services.sh hdfs 

END
	) | more -11 -d
}

main() {
	service_name="$1"

	case "$service_name" in 
		"hdfs" | "zookeeper" | "yarn" | "spark" | "hbase" | "kafka" | "kafka_connect" ) ;;
	    "--help" | "-h" | "")  showUsage && exit 0;;
		*)
			echo "ERROR! Unknown service_name: $service_name" && exit 1;;
	esac

	case "$service_name" in
		"hdfs" ) run_hdfs;;
		"zookeeper" ) run_zookeeper;;
		"yarn" ) run_yarn;;
		"spark" ) run_spark;;
		"hbase" ) run_hbase;;
		"kafka" ) run_kafka;;
		"kafka_connect" ) run_kafka_connect;;
	esac
}

main "$@"