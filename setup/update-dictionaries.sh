#!/usr/bin/env bash
set -e

echo "Updating dictionaries.."
mkdir -p "$RUNCOM_DICTIONARIES"

install_dictionary () {
	curl -L -o "$RUNCOM_DICTIONARIES/$2" "$1"
}

install_dictionary 'https://raw.githubusercontent.com/zeke/moby/master/words.txt' 'en-thesaurus.txt'
