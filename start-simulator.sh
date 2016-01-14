#!/bin/bash
#download the jar
[ ! -e kafka-logs-simulator.jar ] && wget -O - https://github.com/spark-in-action/first-edition/releases/download/logsimulator/kafka-logs-simulator.jar > kafka-logs-simulator.jar

if [[ $@ != *brokerList* && "$KAFKA_IP" != "" ]] ; then
	java -jar kafka-logs-simulator.jar -brokerList=$KAFKA_IP:9092 $@
else
	java -jar kafka-logs-simulator.jar $@
fi
