#!/bin/bash
# Enable trackpoint scrolling and disable touchpad
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" \
	8 200
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" \
	8 6 7 4 5

# Disable TouchPad
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
