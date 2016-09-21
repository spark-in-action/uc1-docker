#!/bin/bash
Z=`ps -ef | grep zookeeper.properties | grep -v grep | awk '{print $2}'`
if [ "$Z" == "" ]; then
	echo Starting Zookeeper
	/usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties &
else
	echo Zookeeper already started
fi
sleep 3
K=`ps -ef | grep kafka | grep server.properties | grep -v grep | awk '{print $2}'`
if [ "$K" == "" ]; then
	echo Starting Kafka
	/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties &
else
	echo Kafka already started
fi

sleep 3
T=`/usr/local/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep weblogs`
if [ "$T" == "" ]; then
	echo Creating weblogs topic
	/usr/local/kafka/bin/kafka-topics.sh --create --topic weblogs --replication-factor 1 --partitions 1 --zookeeper 192.168.10.2:2181
fi
T=`/usr/local/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep stats`
if [ "$T" == "" ]; then
	echo Creating stats topic
	/usr/local/kafka/bin/kafka-topics.sh --create --topic stats --replication-factor 1 --partitions 1 --zookeeper 192.168.10.2:2181
fi



