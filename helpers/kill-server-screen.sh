#!/bin/bash

killServerScreen() {
  logger "[ KILL_SERVER_SCREEN : HELPER ] START"
  local SCREEN_PROCESS
  SCREEN_PROCESS=$( pgrep -f "SCREEN.*$SERVER_NAME" )

  if [ -z "$SCREEN_PROCESS" ]
  then
    logger "There is no server screen to kill"
    logger "[ KILL_SERVER_SCREEN : HELPER ] END"
    return
  fi

  echo "$SCREEN_PROCESS" | cut -d. -f1 | awk '{print $1}' | xargs kill

  logger "Server screen killed"
  logger "[ KILL_SERVER_SCREEN : HELPER ] END"
}
