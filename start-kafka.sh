#!/bin/bash

docker run -d -v /etc/localtime:/etc/localtime:ro --name sia-zookeeper jplock/zookeeper:3.4.6
sleep 3
docker run -d -v /etc/localtime:/etc/localtime:ro --name sia-kafka --link sia-zookeeper:zookeeper ches/kafka

export ZK_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' sia-zookeeper)
export KAFKA_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' sia-kafka)

sleep 5
docker run --rm ches/kafka kafka-topics.sh --create --topic weblogs --replication-factor 1 --partitions 1 --zookeeper $ZK_IP:2181
docker run --rm ches/kafka kafka-topics.sh --create --topic stats --replication-factor 1 --partitions 1 --zookeeper $ZK_IP:2181

