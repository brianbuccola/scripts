#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             display-adjust.sh
# author:           Brian Buccola
#
# description:      If external monitor is present, auto-adjust it and turn off
#                   laptop monitor; otherwise, auto-adjust laptop monitor (and
#                   turn off external monitor).

if [[ -n "$(xrandr | grep "VGA1 connected")" ]]; then
    xrandr --output VGA1 --mode 1280x1024
    xrandr --output LVDS1 --off
else
    xrandr --output LVDS1 --auto
    xrandr --output VGA1 --off
fi
