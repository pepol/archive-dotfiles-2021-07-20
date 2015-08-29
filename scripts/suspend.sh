#!/bin/bash
mpc pause
killall ssh
#killall offlineimap
~pepol/scripts/lock.sh
/usr/sbin/s2ram
#offlineimap &
