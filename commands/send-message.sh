#!/bin/bash

sendMessage() {
  logger "Send Message started"

  checkServerStatus "down"

  if [ -z "$1" ]
  then
    logger "Please write your message: "
    read -r MESSAGE
    sendServerMessage "$MESSAGE"
  else
    sendServerMessage "$1"
  fi

  logger "Send Message completed"
}
