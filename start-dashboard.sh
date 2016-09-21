#!/bin/bash

#[ $# -lt 2 ] && printf "\nTwo arguments needed: Zookeeper address and the Kafka topic name\n\n" && exit 1

cntrunning=`docker ps | grep sia-dashboard | awk '{print $2}'`
[ "$cntrunning" == "sia-dashboard" ] && echo "sia-dashboard already running" && exit 1

existing=`docker images | grep sia-dashboard | awk '{print $1}'`
if [ "$existing" != "sia-dashboard" ]
then
	cd dashboard-image
	docker build -t sia-dashboard .
	cd ..
fi

docker run -d -p 192.168.10.2:80:9080 -v /etc/localtime:/etc/localtime:ro -e "ZKADDR=192.168.10.2:2181" -e "TOPIC=stats" sia-dashboard

