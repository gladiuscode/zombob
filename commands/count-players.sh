#!/bin/bash

countPlayers() {
  echo "[ ZOMBOB : INFO ] > Count Players started"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)

  echo "[ ZOMBOB : INFO ] > $PLAYERS"

  echo "[ ZOMBOB : INFO ] > Count Players stopped"
}
