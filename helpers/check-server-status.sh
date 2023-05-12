#!/bin/bash

checkServerStatus() {
  local STATUS_TO_CHECK=$1
  local STATUS=0

  getServerStatus
  [ -n "$SERVER_PROCESS" ] && STATUS=1 || STATUS=0

  if [ "$STATUS_TO_CHECK" == "up" ] && [ $STATUS -eq 1 ]
  then
    logger "Server is up" && exit 1
  fi

  if [ "$STATUS_TO_CHECK" == "down" ] && [ $STATUS -eq 0 ]
  then
    logger "Server is down" && exit 1
  fi
}
