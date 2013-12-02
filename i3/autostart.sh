#!/bin/bash

amixer sset Master,0 35%

xset -b &
setxkbmap -layout us,sk -option "" & 
xset dpms 300 600 900 &
xbacklight -set 80 &

## Compositing
#xcompmgr -c -r 4.2 -o .55 -l -5 -t -5 -C &

## OSD
dunst &
## Wi-Fi GTK client
#wicd-gtk -t &
