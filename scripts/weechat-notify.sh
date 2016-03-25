#!/bin/bash

echo "Notifying with: '$*'" >> ~/scripts/weechat-notify.log
echo "$*" | xargs notify-send -t 1000 -a 
