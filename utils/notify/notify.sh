#!/usr/bin/env bash

# Keep track of the drones
# Don't worry, this will only run if you explicitly tell it to.

RUNCOM_DESCRIPTION='Default description.'

if [ -f "$HOME/.localenv" ]; then
	source "$HOME/.localenv"
fi

NOTIFY_NAME=notify-swarm-$(hostname)

data="{"
data+="\"uname\":\"$(uname -a)\","
data+="\"uptime\":\"$(uptime)\","
data+="\"date\":\"$(date --rfc-3339=seconds)\","
data+="\"xip\":\"$(curl -s https://canihazip.com/s)\","
data+="\"ip\":\"$(hostname -I 2>/dev/null || /usr/sbin/ipconfig getifaddr en1)\","
data+="\"hostname\":\"$(hostname)\","
data+="\"df\":\"$(df | grep -E '/$')\","
data+="\"description\":\"$RUNCOM_DESCRIPTION\","
data+="\"version\":\"$(git describe --abbrev=0)\""
data+="}"

curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d "$data" \
  "https://notify.goude.se/set/$NOTIFY_NAME?appkey=$NOTIFY_APPKEY"

