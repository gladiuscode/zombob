#!/bin/bash

getServerStatus() {
  SERVER_PROCESS=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
}
