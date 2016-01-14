#!/bin/bash

cntrunning=`docker ps | grep sia-spark | awk '{print $2}'`
[ "$cntrunning" == "sia-spark" ] && echo "sia-spark already running" && exit 1

existing=`docker images | grep sia-spark | awk '{print $1}'`
if [ "$existing" != "sia-spark" ]
then
	echo Building Spark image...
	cd spark-image
	docker build -t sia-spark .
	cd ..
fi

echo Kafka IP is set to $KAFKA_IP

docker run -d -p 8088:8088 -p 8042:8042 -v /etc/localtime:/etc/localtime:ro  -h sandbox sia-spark "sleep 15 && spark-submit --master local[3] --class org.sia.loganalyzer.StreamingLogAnalyzer streaming-log-analyzer.jar -brokerList=$KAFKA_IP:9092 -checkpointDir=hdfs://sandbox:9000/sparkCheckpoint"

