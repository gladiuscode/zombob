#!/bin/bash

sendMessage() {
  logger "[ ZOMBOB : INFO ] > Send Message started"

  checkServerStatus "down"

  if [ -z "$1" ]
  then
    logger "[ ZOMBOB : INFO ] > Please write your message: "
    read -r MESSAGE
    sendServerMessage "$MESSAGE"
  else
    sendServerMessage "$1"
  fi

  logger "[ ZOMBOB : INFO ] > Send Message completed"
}
