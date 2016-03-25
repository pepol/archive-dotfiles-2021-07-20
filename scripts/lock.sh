#!/bin/bash

# System locked blurred
scrot /tmp/l.png
mogrify -scale 10% -scale 1000% /tmp/l.png
convert -background Red -fill white -gravity center -size `identify -format %w /tmp/l.png`x30 caption:"System Locked" /tmp/l.png +swap -composite /tmp/l.modified.png

## Just screenshot, very nasty
#scrot /tmp/l.modified.png


i3lock -i /tmp/l.modified.png
