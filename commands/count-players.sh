#!/bin/bash

countPlayers() {
  logger "[ ZOMBOB : INFO ] > Count Players started"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)

  logger "[ ZOMBOB : INFO ] > $PLAYERS"

  logger "[ ZOMBOB : INFO ] > Count Players stopped"
}
