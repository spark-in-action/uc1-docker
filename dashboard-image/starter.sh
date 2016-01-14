#!/bin/bash

mkdir /opt/ibm/wlp/etc
echo "-Dzookeeper.address="$ZKADDR >> /opt/ibm/wlp/etc/jvm.options
echo "-Dkafka.topic="$TOPIC >> /opt/ibm/wlp/etc/jvm.options

/opt/ibm/wlp/bin/server run defaultServer

