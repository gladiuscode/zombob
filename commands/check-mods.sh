#!/bin/bash

checkMods() {
  logger "[ CHECK_MODS ] START"

  checkServerStatus "down"

  read -r SERVER_STARTUP_DATE < "$ZOMBOB_DATA_ENV_FILE_PATH"

  local WORKSHOP_ITEMS
  local ITEMS=()
  local ITEM_COUNT
  local PUBLISHED_FIELD_IDS=()
  local CURL_COMMAND
  local RESPONSE
  local FILTERED_RESPONSE
  local RESTART_NEEDED=0

  WORKSHOP_ITEMS=$(grep -o "WorkshopItems.*" "$SERVER_INI_PATH" )

  readWorkshopItemsFromConfig() {
    local OLD_IFS=$IFS
    IFS="=;"

    read -ra RAW_ITEMS <<< "$WORKSHOP_ITEMS"
    for RAW_ITEM in "${RAW_ITEMS[@]}"; do
      if [ "$RAW_ITEM" != "WorkshopItems" ]
        then
          ITEMS=( "${ITEMS[@]}" "$RAW_ITEM" )
        fi
    done

    IFS=$OLD_IFS
  }

  createApiParams() {
    local ITEMS_LENGTH=${#ITEMS[@]}
    ITEM_COUNT="itemcount=$ITEMS_LENGTH"

    for (( i = 0; i < "$ITEMS_LENGTH"; i++ )); do
        local ITEM="${ITEMS[$i]}"
        [ "$i" == "${#ITEMS_LENGTH[@]}" ] && END="\\" || END=""
        PUBLISHED_FIELD_ID="--data-urlencode \"publishedfileids[$i]=$ITEM\" $END"
        PUBLISHED_FIELD_IDS=( "${PUBLISHED_FIELD_IDS[@]}" "$PUBLISHED_FIELD_ID" )
    done
  }

  createCurlCommand() {
    CURL_COMMAND="curl --location --request POST \"$STEAM_API_ENDPOINT\" \\--header \"Content-Type: application/x-www-form-urlencoded\" \\--data-urlencode \"$ITEM_COUNT\" \\"

    for ID in "${PUBLISHED_FIELD_IDS[@]}"; do
      CURL_COMMAND="$CURL_COMMAND$ID"
    done
  }

  checkRestartNeeded() {
    while read -r LINE; do
      local TIMESTAMP
      local WORKSHOP_ITEM_LAST_UPDATE

      TIMESTAMP=$( echo "$LINE" | tr -dc '0-9' )
      WORKSHOP_ITEM_LAST_UPDATE=$( date -d "@$TIMESTAMP" +"%s" )

      if [ "$SERVER_STARTUP_DATE" -lt "$WORKSHOP_ITEM_LAST_UPDATE" ]
      then
        RESTART_NEEDED=1
      fi
    done < "$ZOMBOB_DATA_STEAM_API_RESPONSE"
  }

  readWorkshopItemsFromConfig
  createApiParams
  createCurlCommand

  RESPONSE=$( eval "$CURL_COMMAND" )
  FILTERED_RESPONSE=$( grep -Eo "\"time_updated\":[0-9]+" <<< "$RESPONSE" )

  if test -f "$ZOMBOB_DATA_STEAM_API_RESPONSE"; then
      rm "$ZOMBOB_DATA_STEAM_API_RESPONSE"
  fi
  echo "$FILTERED_RESPONSE" > "$ZOMBOB_DATA_STEAM_API_RESPONSE"

  checkRestartNeeded "$FILTERED_RESPONSE"

  if [ $RESTART_NEEDED -eq 0 ]
  then
     logger "Mods are up to date"
     logger "[ CHECK_MODS ] END"
     return
  fi

  actionSelector "restart" "toUpdate"
  logger "[ CHECK_MODS ] END"
}


