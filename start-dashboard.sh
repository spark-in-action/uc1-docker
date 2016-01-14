#!/bin/bash

[ $# -lt 2 ] && printf "\nTwo arguments needed: Zookeeper address and the Kafka topic name\n\n" && exit 1

cntrunning=`docker ps | grep sia-dashboard | awk '{print $2}'`
[ "$cntrunning" == "sia-dashboard" ] && echo "sia-dashboard already running" && exit 1

existing=`docker images | grep sia-dashboard | awk '{print $1}'`
if [ "$existing" != "sia-dashboard" ]
then
	cd dashboard-image
	docker build -t sia-dashboard .
	cd ..
fi

docker run -d -p `hostname -i`:80:9080 -v /etc/localtime:/etc/localtime:ro -e "ZKADDR="$1 -e "TOPIC="$2 sia-dashboard

