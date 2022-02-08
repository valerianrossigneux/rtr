#!/bin/bash
write() {
  local log="/opt/CrowdStrike/RTR/get_sensortag_$(date +%s).json"
  local json='{"SensorTag":"%s"}'
  if [ "$2" = '{"Log":true}' ]; then
    if [ ! -d "/opt/CrowdStrike/RTR" ]; then
      mkdir "/opt/CrowdStrike/RTR"
    fi
    printf "$json" "$1" >> "$log"
  fi
  printf "$json" "$1"
}
tag=$(/opt/CrowdStrike/falconctl -g --tags | sed 's/^Sensor grouping tags are not set.//; s/^tags=//; s/.$//')
write "$tag" "$1"