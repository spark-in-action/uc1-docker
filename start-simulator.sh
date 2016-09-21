#!/bin/bash
#download the jar
[ ! -e kafka-logs-simulator.jar ] && wget -O - https://github.com/spark-in-action/first-edition/releases/download/logsimulator/kafka-logs-simulator.jar > kafka-logs-simulator.jar

if [[ $@ == *-brokerList=* ]] ; then
	java -jar kafka-logs-simulator.jar $@
else
	java -jar kafka-logs-simulator.jar -brokerList=192.168.10.2:9092 $@
fi

