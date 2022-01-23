#!/bin/bash

killServer() {
  SCREEN_PROCESS=$( pgrep -f "SCREEN -S $SERVER_NAME" )

  if [ -z "$SCREEN_PROCESS" ]
  then
    echo "[ ZOMBOB : INFO ] > There is no server screen to kill"
    return
  fi

  echo "[ ZOMBOB : INFO ] > Killing server screen"
  echo "$SCREEN_PROCESS" | cut -d. -f1 | awk '{print $1}' | xargs kill
}
