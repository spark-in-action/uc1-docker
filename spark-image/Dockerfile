FROM sequenceiq/spark:1.5.1

RUN curl -L -O https://github.com/spark-in-action/first-edition/releases/download/loganalyzer/streaming-log-analyzer.jar > /streaming-log-analyzer.jar
COPY log4j.properties /usr/local/spark/conf/log4j.properties

