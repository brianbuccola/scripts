#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             display-adjust.sh
# author:           Brian Buccola
#
# description:      If external monitor is present, auto-adjust it and turn off
#                   laptop monitor; otherwise, auto-adjust laptop monitor (and
#                   turn off external monitor).

if [[ -n "$(xrandr | grep "VGA-0 connected")" ]]; then
    xrandr --output VGA-0 --auto
    xrandr --output LVDS --off
else
    xrandr --output LVDS --auto
    xrandr --output VGA-0 --off
fi
