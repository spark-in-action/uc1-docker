#!/bin/bash
if [ "$ZK_IP" == "" ] ; then
	echo "ZK_IP variable needs to be set"
	exit 1
fi
docker run --rm ches/kafka kafka-console-consumer.sh --zookeeper $ZK_IP:2181 --topic stats

