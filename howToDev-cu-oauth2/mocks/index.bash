#!/bin/bash

dockerComposeFile=docker-compose-mystique.yml
kafkaHome=/opt/homebrew/bin

if [ "$1" = "up-no-recreate" ]; then
    docker-compose -f $dockerComposeFile up --no-recreate
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

if [ "$1" = "logs" ]; then
    docker logs $2 -n 100
    exit
fi

if [ "$1" = "openPorts" ]; then
    netstat -anvp tcp | awk 'NR<3 || /LISTEN/'
    exit
fi

if [ "$1" = "kafka" ]; then

   if [ "$2" = "consumer" ]; then
   $kafkaHome/kafka-console-consumer --bootstrap-server localhost:9092 --topic $3 --from-beginning --property "print.key=true" --property "print.value=true" --property "key.separator= : "
   fi

   if [ "$2" = "producer" ]; then
   tr '\n' ' ' < $4 | $kafkaHome/kafka-console-producer --broker-list localhost:9092 --topic $3 --property "parse.key=true" --property "key.separator=:"
   fi

   if [ "$2" = "delete" ]; then
    $kafkaHome/kafka-delete-records --bootstrap-server localhost:9092 -offset-json-file $3
   fi

   if [ "$2" = "listTopics" ]; then
    $kafkaHome/kafka-topics --bootstrap-server localhost:9092 --list
   fi

   exit
fi

    echo "Usage:"
    echo " o index.bash {start, stop, status, statusAll}"
    echo " o index.bash startColima"
    echo " o index.bash up-no-recreate"
    echo " o index.bash openPorts"
    echo " o index.bash logs {container-name}"
    echo " o index.bash kafka {consumer, producer, listTopics} [topic] [jsonFile]  / {delete} [jsonFile]  "

