#!/bin/bash

(i3status -c ~pepol/.i3status.dwm.conf | while read LINE; do xsetroot -name "$LINE"; done) &
