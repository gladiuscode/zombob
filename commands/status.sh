#!/bin/bash

status() {
  logger "[ ZOMBOB : INFO ] > Server Status started"

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  [ -n "$serverProcess" ] && MESSAGE="online" || MESSAGE="offline"

  logger "[ ZOMBOB : INFO ] > Status: $MESSAGE"
  logger "[ ZOMBOB : INFO ] > Server Status completed"

  logger -s $MESSAGE
}
