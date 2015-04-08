#!/bin/bash

OUTPUTS="VGA1 HDMI1"

xrandr --output LVDS1 --primary
xrandr --output LVDS1 --auto

for OUT in $OUTPUTS; do
    out_status=`xrandr | grep $OUT | awk '{print $2}'`
    if [ "$out_status" = "connected" ]; then
        case $OUT in
            VGA*)
                xrandr --output $OUT --auto
                xrandr --output $OUT --left-of LVDS1
                ;;
            HDMI*)
                xrandr --output $OUT --auto
                xrandr --output $OUT --right-of LVDS1
                ;;
            *)
                echo "Error with display" && exit 1
                ;;
        esac
    else
        xrandr --output $OUT --off
    fi
done

xrandr --output LVDS1 --auto
#i3-msg restart
fbsetbg -l

exit 0
