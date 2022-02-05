#!/bin/bash

status() {
  logger "Server Status started"

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  [ -n "$serverProcess" ] && STATUS="online" || STATUS="offline"

  logger "Status: $STATUS"
  logger -s $STATUS

  logger "Server Status completed"
}
