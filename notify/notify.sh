#!/usr/bin/env bash

# Keep track of the drones
# Don't worry, this will only run if you explicitly tell it to.

NOTIFY_NAME=notify-swarm-$(hostname)

data="{"
data+="\"uname\":\"$(uname -a)\","
data+="\"uptime\":\"$(uptime)\","
data+="\"date\":\"$(date)\","
data+="\"xip\":\"$(curl -s https://canihazip.com/s)\","
data+="\"ip\":\"$(hostname -I 2>/dev/null || ipconfig getifaddr en1)\","
data+="\"hostname\":\"$(hostname)\""
data+="}"

curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d "$data" \
  "https://notify.goude.se/set/$NOTIFY_NAME?appkey=$NOTIFY_APPKEY"

