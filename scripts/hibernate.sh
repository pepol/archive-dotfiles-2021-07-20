#!/bin/bash
dropbox stop
mpc pause; amixer -c 0 sset Master,0 0
~pepol/scripts/lock.sh
systemctl hibernate

dropbox start
