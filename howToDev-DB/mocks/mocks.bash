#!/bin/bash
version=30082023
source "mocks-config.bash"

if [ "$1" = "up-no-recreate" ]; then
    docker-compose -f $dockerComposeFile up --no-recreate
    exit
fi

if [ "$1" = "down" ] || [ "$1" = "start" ] || [ "$1" = "stop" ]; then

    if [ "$1" = "down" ]; then
    read -t 20 -p 'This will remove ALL containers, if you are sure type - DOWN: ' line

      if [ "$line" != "DOWN" ]; then
        echo 'Exiting without any changes.'
        exit
      fi
    fi

    docker-compose -f $dockerComposeFile $1
    exit
fi

if [ "$1" = "status" ]; then
    docker ps --format '{{.Status}} {{.Names}}' | grep $dockerPrefixContainer
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

   if [ "$2" = "help" ]; then
      echo " o mocks.bash kafka consumer [topic] [group.id]"
      echo " o mocks.bash kafka producer [topic] [messageFile]"
      echo " o mocks.bash kafka delete [configFile]"
      echo " o mocks.bash kafka {listTopics, describeTopics}"
      echo " o mocks.bash kafka consumer-groups {all, group.id}"
      exit
   fi

   if [ "$2" = "consumer" ]; then
     if [ "$4" = "" ]; then
       echo "Must type group.id"
       exit
     fi

   $kafkaHome/kafka-console-consumer --bootstrap-server $kafkaBootstrapServer --topic $3 --group $4 --from-beginning --property "print.key=true" --property "print.value=true" --property "key.separator= : "
   exit
   fi

   if [ "$2" = "consumer-groups" ]; then

      if [ "$3" = "all" ]; then
        $kafkaHome/kafka-consumer-groups --bootstrap-server $kafkaBootstrapServer --describe --all-groups
      else
        $kafkaHome/kafka-consumer-groups --bootstrap-server $kafkaBootstrapServer --describe --group $3
      fi

      exit

   fi

   if [ "$2" = "producer" ]; then
   tr '\n' ' ' < $4 | $kafkaHome/kafka-console-producer --broker-list $kafkaBootstrapServer --topic $3 --property "parse.key=true" --property "key.separator=:"
   exit
   fi

   if [ "$2" = "delete" ]; then
    $kafkaHome/kafka-delete-records --bootstrap-server $kafkaBootstrapServer -offset-json-file $3
    exit
   fi

   if [ "$2" = "listTopics" ]; then
    $kafkaHome/kafka-topics --bootstrap-server $kafkaBootstrapServer --list
    exit
   fi

   if [ "$2" = "describeTopics" ]; then
       $kafkaHome/kafka-topics --bootstrap-server $kafkaBootstrapServer --describe
       exit
   fi
   echo "Unknown options. Exiting"
   exit
fi

if [ "$1" = "activemq" ]; then
     if [ "$2" = "help" ]; then
        echo " o To send, view messages please use activemq web console on http://hostname:8161/admin/queues.jsp"
        exit
     fi
fi

    echo "Usage:"
    echo " o mocks.bash {start, stop, status, statusAll, down}"
    echo " o mocks.bash startColima"
    echo " o mocks.bash up-no-recreate"
    echo " o mocks.bash openPorts"
    echo " o mocks.bash logs {container-name}"
    echo " o mocks.bash kafka help"
    echo " o mocks.bash activemq help"


