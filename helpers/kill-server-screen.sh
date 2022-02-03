#!/bin/bash

killServerScreen() {
  SCREEN_PROCESS=$( pgrep -f "SCREEN.*$SERVER_NAME" )

  if [ -z "$SCREEN_PROCESS" ]
  then
    logger "[ ZOMBOB : INFO ] > There is no server screen to kill"
    return
  fi

  logger "[ ZOMBOB : INFO ] > Killing server screen"
  logger "$SCREEN_PROCESS" | cut -d. -f1 | awk '{print $1}' | xargs kill
}
