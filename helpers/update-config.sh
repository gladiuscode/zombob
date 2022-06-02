#!/bin/bash

updateConfig() {
  local REPLACE_STRING="SERVER_NAME=\"servertest\""
  local WITH_STRING="SERVER_NAME=\"${SERVER_NAME}\""

  sed -i "s/$REPLACE_STRING/$WITH_STRING/" "$CONFIGURATION_PATH"

  echo "Operating on: $SERVER_NAME"
}
