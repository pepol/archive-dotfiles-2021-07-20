#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout us -option ctrl:nocaps &

export MPD_HOST="password@localhost"

## DWM
/home/pepol/scripts/autostart.sh &
/home/pepol/scripts/dwmstatus.sh &
exec ck-launch-session dbus-launch dwm
