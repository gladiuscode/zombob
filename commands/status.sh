#!/bin/bash

status() {
  logger "[ ZOMBOB : INFO ] > Server Status started"

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  MESSAGE="Offline"
  [ -n "$serverProcess" ] && MESSAGE="Online" || MESSAGE="Offline"

  logger "[ ZOMBOB : INFO ] > Status: $MESSAGE"
  logger "[ ZOMBOB : INFO ] > Server Status completed"

  logger -s $MESSAGE
}
