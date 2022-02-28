#!/bin/bash

status() {
  logger "[ STATUS ] START"

  getServerStatus
  [ -n "$SERVER_PROCESS" ] && STATUS="online" || STATUS="offline"

  logger "Server is $STATUS"

  logger "[ STATUS ] END"
}
