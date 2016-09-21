#!/bin/bash

if [ ! -f streaming-log-analyzer.jar ]; then
	echo Downloading Streaming Log Analyzer
	wget https://github.com/spark-in-action/first-edition/releases/download/loganalyzer/streaming-log-analyzer.jar
fi

echo Submitting Spark job
spark-submit --master local[3] --class org.sia.loganalyzer.StreamingLogAnalyzer streaming-log-analyzer.jar -brokerList=192.168.10.2:9092 -checkpointDir=file:///tmp/sparkCheckpointDir

