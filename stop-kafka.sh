#!/bin/bash

PID=`ps -ef | grep kafka | grep server.properties | grep -v grep | awk '{print $2}'`
if [ "$PID" != "" ]; then
        echo Stopping Kafka
        kill -9 $PID
else
        echo Kafka not running
fi

PID=`ps -ef | grep QuorumPeerMain | grep -v grep | awk '{print $2}'`
if [ "$PID" != "" ]; then
	echo Stopping Zookeeper
	kill -9 $PID
else
	echo Zookeeper not running
fi

