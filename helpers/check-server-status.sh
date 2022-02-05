#!/bin/bash

checkServerStatus() {
  STATUS_TO_CHECK=$1

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  STATUS=0
  [ -n "$serverProcess" ] && STATUS=1 || STATUS=0

  if [ "$STATUS_TO_CHECK" == "up" ] && [ $STATUS -eq 1 ]
  then
    logger -e "Server is up" && exit
  fi

  if [ "$STATUS_TO_CHECK" == "down" ] && [ $STATUS -eq 0 ]
  then
    logger -e "Server is down" && exit
  fi
}
