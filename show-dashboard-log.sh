#!/bin/bash

docker exec -it `docker ps | grep sia-dashboard | awk '{print $1}'` cat /logs/messages.log

