#!/bin/bash

scrot /tmp/l.png
mogrify -scale 10% -scale 1000% /tmp/l.png
convert -background Red -fill white -gravity center -size `identify -format %w /tmp/l.png`x30 caption:"System Locked" /tmp/l.png +swap -composite /tmp/l.modified.png
#i3lock -b -c 909090
i3lock -i /tmp/l.modified.png
i3-msg mode default
