#!/bin/bash

docker exec -it `docker ps | grep sia-spark | awk '{print $1}'` cat /tmp/loganalyzer.log

