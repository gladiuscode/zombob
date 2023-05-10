#!/bin/bash

checkScriptAvailability() {
  logger "Controllo disponibilità script"
  readTrackedStatus

  if [ "$TRACKED_STATUS" != "none" ]
  then
     logger "Script running. Please wait" && exit 1
  fi
  logger "Script disponibile"
}
