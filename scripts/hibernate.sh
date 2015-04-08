#!/bin/bash
dropbox stop
mpc pause; amixer -c 0 sset Master,0 0
killall ssh
killall offlineimap
~pepol/scripts/lock.sh
systemctl hibernate

dropbox start
offlineimap &
