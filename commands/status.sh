#!/bin/bash

status() {
  echo "[ ZOMBOB : INFO ] > Server Status started"

  serverProcess=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  MESSAGE="Offline"
  [ -n "$serverProcess" ] && MESSAGE="Online" || MESSAGE="Offline"

  echo "[ ZOMBOB : INFO ] > Status: $MESSAGE"
  echo "[ ZOMBOB : INFO ] > Server Status completed"
}
