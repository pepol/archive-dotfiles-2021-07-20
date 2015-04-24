#!/bin/bash

## AUTOSTART SCRIPT v.1.0
## by Peter Polacik <polacik.p@gmail.com>

## SETUP
~pepol/scripts/trackpoint.sh &
fbsetbg -l &
amixer sset Master,0 35% &
xset -b &
setxkbmap -layout us,sk -option "" &
xset dpms 300 600 900 &
xbacklight -set 80 &
dunst &

## APPS
#psi &
pidgin &
skype &
#dropboxd &
# TODO: add tmux session in urxvt
#urxvt -title "tilde-term" -geometry 227x21 &
#urxvt -e ncmpcpp &
st -t "tilde-term" -g 1362x350 -e tmux -L ppx new-session -A -s main &
st -e ncmpcpp &
firefox &
thunderbird &
#gpodder &

~/scripts/mail-notify.sh
