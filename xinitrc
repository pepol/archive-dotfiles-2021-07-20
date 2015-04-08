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

setxkbmap -layout us &
setxkbmap -option terminate:ctrl_alt_bksp &

#exec openbox-session
#exec subtle
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

## i3
exec i3 

## XMonad
#xrdb -merge .Xresources
#xsetroot -cursor_name left_ptr &
#exec xmonad

## DWM
#/home/pepol/scripts/autostart.sh &
#/home/pepol/scripts/dwmstatus.sh &
#exec /home/pepol/bin/dwm
