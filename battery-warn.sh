#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             battery-warn.sh
# author:           Brian Buccola
#
# description:      This script warns you when your battery dips below a
#                   certain percentage and gives you the option to shutdown
#                   immediately. Requires xmessage.

STATUS=$(cat /sys/class/power_supply/AC0/online)
NOW=$(cat /sys/class/power_supply/BAT0/energy_now)
FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
PCT=$(echo "$NOW / $FULL * 100" | bc -l | sed 's/\.[0-9]*//')

# If charging, do nothing and exit.
if [[ $STATUS -eq 1 ]]; then
    exit 0
fi

# If more than 5%, do nothing and exit.
if [[ $PCT -gt 5 ]]; then
    exit 0
fi

# If discharging and at 5% or below, raise xmsg
ANSWER=$(DISPLAY=:0 xmessage -center -buttons yes,no -print \ "Low battery: $PCT%. Shut down now?")
if [[ "$ANSWER" = "yes" ]]; then
    sudo systemctl poweroff
else
    exit 0
fi
