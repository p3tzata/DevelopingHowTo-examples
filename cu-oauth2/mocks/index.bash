#!/bin/bash

dockerComposeFile=docker-compose.yml
kafkaFiles=/Users/petarchavdarov/Documents/kafkaFiles


if [ "$1" = "up-no-recreate" ]; then
    docker-compose -f $dockerComposeFile up --no-recreate
    exit
fi

if [ "$1" = "down" ]; then
    docker-compose -f $dockerComposeFile down
    exit
fi

if [ "$1" = "start" ] || [ "$1" = "stop" ]; then
    docker-compose -f $dockerComposeFile $1
    exit
fi

if [ "$1" = "status" ]; then
    docker ps --format '{{.Status}} {{.Names}}'
    exit
fi
if [ "$1" = "statusAll" ]; then
    docker ps -a --format '{{.Status}} {{.Names}}'
    exit
fi

if [ "$1" = "startColima" ]; then
    colima start
    exit
fi

if [ "$1" = "logNginx" ]; then
    docker logs mystique-mocks-nginx-proxy-1
    exit
fi

if [ "$1" = "openPorts" ]; then
    netstat -anvp tcp | awk 'NR<3 || /LISTEN/'
    exit
fi

if [ "$1" = "kafka" ]; then

   if [ "$2" = "consumer" ]; then
   /usr/local/opt/kafka/bin/kafka-console-consumer --bootstrap-server localhost:9092 --topic $3 --from-beginning
   fi

   if [ "$2" = "producer" ]; then
   #/usr/local/opt/kafka/bin/kafka-console-producer --broker-list localhost:9092 --topic $3 --property "parse.key=true" --property "key.separator=:"  < $4
   tr '\n' ' ' < $4 | /usr/local/opt/kafka/bin/kafka-console-producer --broker-list localhost:9092 --topic $3 --property "parse.key=true" --property "key.separator=:"
   fi

   if [ "$2" = "delete" ]; then
    /usr/local/opt/kafka/bin/kafka-delete-records --bootstrap-server localhost:9092 -offset-json-file $3
   fi



   exit
fi
    echo "Usage:"
    echo " o index.bash start"
    echo " o index.bash stop"
    echo " o index.bash {status,statusAll}"
    echo " o index.bash startColima"
    echo " o index.bash up-no-recreate"
    echo " o index.bash down"
    echo " o index.bash openPorts"
    echo " o index.bash logNginx"
    echo " o index.bash kafka {consumer,producer} [topic] [jsonFile]  / {delete} [jsonFile]  "

