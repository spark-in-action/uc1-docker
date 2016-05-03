#!/bin/bash

. ./start-kafka.sh

. ./start-dashboard.sh $ZK_IP:2181 stats

. ./start-spark.sh

