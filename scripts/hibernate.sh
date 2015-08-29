#!/bin/bash
dropbox stop
mpc pause; amixer -c 0 sset Master,0 0
killall ssh
killall offlineimap
~pepol/scripts/lock.sh
/usr/sbin/s2disk

dropbox start
offlineimap &
