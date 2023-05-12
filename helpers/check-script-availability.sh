#!/bin/bash

checkScriptAvailability() {
  logger "Controllo disponibilità script"
  readTrackedStatus

  if [ "$TRACKED_STATUS" != "none" ]
  then
     logger "[Discord] Un'altra operazione è attiva, per favore aspetta"
     logger "Script running. Please wait"
     exit 1
  fi
  logger "Script disponibile"
}
