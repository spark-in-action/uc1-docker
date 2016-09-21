#!/bin/bash

echo Stopping sia-dashboard
CID=`docker ps | grep sia-dashboard | awk '{print $1}'`
if [ "" != "$CID" ]; then
	docker kill $CID
fi

