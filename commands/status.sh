#!/bin/bash

status() {
  logger "Server Status started"

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  [ -n "$serverProcess" ] && MESSAGE="online" || MESSAGE="offline"

  logger "Status: $MESSAGE"
  logger -s $MESSAGE

  logger "Server Status completed"
}
