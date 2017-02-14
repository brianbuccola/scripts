#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             battery-warn.sh
# author:           Brian Buccola
#
# description:      This script warns you when your battery dips below a
#                   certain percentage and gives you the option to shutdown
#                   immediately. Requires xmessage and bc.

STATUS=$(cat /sys/class/power_supply/AC/online)
NOW=$(cat /sys/class/power_supply/BAT0/energy_now)
FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
PCT_NOW=$(echo "$NOW / $FULL * 100" | bc -l | sed 's/\.[0-9]*//')

# Percent at which to raise warning.
PCT_THRESHOLD=10

# If charging, do nothing and exit.
if [[ $STATUS -eq 1 ]]; then
    exit 0
fi

# If more than $PCT_THRESHOLD, do nothing and exit.
if [[ $PCT_NOW -gt $PCT_THRESHOLD ]]; then
    exit 0
fi

# If discharging and at $PCT_THRESHOLD or below, make a beep and raise xmessage
# warning.
echo -e "\a"
DISPLAY=:0 xmessage -center -print "Low battery: $PCT_NOW%."
