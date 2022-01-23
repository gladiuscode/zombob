#!/bin/bash

killServer() {
  PROCESS=$( pgrep -f "./start-server.sh -servername $SERVER_NAME" )

  if [ -z "$PROCESS" ]
  then
    echo "[ ZOMBOB : INFO ] > There is no server screen to kill"
    return
  fi

  echo "[ ZOMBOB : INFO ] > Killing server screen"
  echo "$PROCESS" | cut -d. -f1 | awk '{print $1}' | xargs kill
}
