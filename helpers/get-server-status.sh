#!/bin/bash

getServerStatus() {
  logger "[ GET_SERVER_STATUS : HELPER ] START"
  SERVER_PROCESS=$(pgrep -f "./start-server.sh -servername $SERVER_NAME")
  logger "[ GET_SERVER_STATUS : HELPER ] END"
}
