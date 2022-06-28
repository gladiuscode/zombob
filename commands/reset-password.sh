#!/bin/bash

resetPassword() {
  logger "[ RESET PASSWORD ] START"

  local USERNAME=$1
  local SELECT_USER_ID="select id from whitelist where username LIKE '$USERNAME'"
  local USER_ID=$(sqlite3 "$DATABASE_PATH" "$SELECT_USER_ID")

  [ -z "$USER_ID" ] && logger "No id found for $USERNAME" && exit 1

  local RESET_USER_PWD="update whitelist set password = NULL where id = $USER_ID"
  sqlite3 "$DATABASE_PATH" "$RESET_USER_PWD"

  logger "[ RESET PASSWORD ] END"
}
