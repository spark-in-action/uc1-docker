#!/bin/bash
images="sia-dashboard sia-spark sia-kafka sia-zookeeper"
for img in $images
do
	echo $img
	CID=$(docker ps | grep $img | awk '{print $1}')
	echo $CID
	docker kill $CID
	docker rm $CID
done

