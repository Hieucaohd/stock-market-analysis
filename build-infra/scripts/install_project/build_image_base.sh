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

createBaseImage() {
	base_image_name="$1"

	docker image rm stock-market-analysis/base-$base_image_name:latest || true

	case "$base_image_name" in
		"hdfs" | "hive" | "spark" | "kafka" | "kali-java" ) 
			docker build ./build-infra/base-image/base-$base_image_name/ --force-rm --no-cache -t stock-market-analysis/base-$base_image_name:latest;;
		"airflow" )
			docker build ./build-infra/base-image/base-airflow/ \
				--force-rm \
				--no-cache \
				--build-arg AIRFLOW_UID_OVERWRITE="${AIRFLOW_UID}" \
				--build-arg AIRFLOW_GID_OVERWRITE="${AIRFLOW_GID}" \
				-t stock-market-analysis/base-airflow:latest;;
	esac
}

pushBaseImage() {
	base_image_name="$1"
	docker image rm caotrunghieu192/base-$base_image_name:latest || true
	docker tag stock-market-analysis/base-$base_image_name:latest caotrunghieu192/base-$base_image_name:latest
	docker push caotrunghieu192/base-$base_image_name:latest
}

showUsage() {
	(
		cat << 'END'

Usage:
	./build-infra/scripts/build_image_base.sh <service> [options] 

	service
		hdfs, hive, spark, airflow, kafka, kali-java
	
	options
		-h, --help			Displays how to use this command
		-b, --build			Remove base image of service if exists and recreate base image
		-p, --push          Push base image to docker hub

Examples:
	./build-infra/scripts/build_image_base.sh hdfs -b -p

END
	) | more -11 -d
}

main() {
	set -e
	cd "$(dirname $0)/../../"

	prepareEnvFile
	setEnv

	base_image_name="$1"

	case "$base_image_name" in 
		"hdfs" | "hive" | "spark" | "airflow" | "kafka" | "kali-java" ) ;;
	    "--help" | "-h" | "")  showUsage && exit 0;;
		*)
			echo "ERROR! Unknown base_image_name: $base_image_name" && exit 1;;
	esac

	if  
		[[ " ${@:2} " == *" -b "* ]] 		|| 
		[[ " ${@:2} " == *" --build "* ]] 	|| 
		[[ " ${@:2} " == *" -bp "* ]] 		|| 
		[[ " ${@:2} " == *" -pb "* ]]; then
		echo "Re build $base_image_name base image"
		createBaseImage "$base_image_name"
	fi

	if  
		[[ " ${@:2} " == *" -p "* ]] 		|| 
		[[ " ${@:2} " == *" --push "* ]] 	|| 
		[[ " ${@:2} " == *" -bp "* ]] 		|| 
		[[ " ${@:2} " == *" -pb "* ]]; then
		echo "Push $base_image_name base image to docker hub"
		pushBaseImage "$base_image_name"
	fi
}

main "$@"
