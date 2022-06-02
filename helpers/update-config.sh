#!/bin/bash

updateConfig() {
  local REPLACE_STRING="SERVER_NAME=\"${SERVER_NAME}\""
  local WITH_STRING="SERVER_NAME=\"${CUSTOM_SERVER_NAME}\""

  sed -i "s/$REPLACE_STRING/$WITH_STRING/" "$CONFIGURATION_PATH"

  echo "Operating on: $CUSTOM_SERVER_NAME"
}
