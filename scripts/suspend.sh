#!/bin/bash
mpc pause
killall ssh
#killall offlineimap
~pepol/scripts/lock.sh
systemctl suspend
#offlineimap &
