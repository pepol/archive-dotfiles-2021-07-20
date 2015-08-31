#!/bin/bash

SONG_DATA=$(mpc -f "%artist% - %title%" | head -n1)

notify-send -u low -t 1000 -a mpd -c audio "Now Playing" "$SONG_DATA"
