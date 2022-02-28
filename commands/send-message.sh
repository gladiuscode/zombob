#!/bin/bash

sendMessage() {
  logger "[ SEND_MESSAGE ] START"

  checkServerStatus "down"

  executeOutro() {
    logger "Message sent"
    logger "[ SEND_MESSAGE ] END"
  }

  if [ -n "$1" ]
  then
    sendServerMessage "$1"
    executeOutro
    return
  fi

  logger "Please write your message: "
  read -r MESSAGE
  sendServerMessage "$MESSAGE"

  executeOutro
}
