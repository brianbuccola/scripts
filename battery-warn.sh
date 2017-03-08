#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             battery-warn.sh
# author:           Brian Buccola
#
# description:      This script warns you when your battery dips below a
#                   certain percentage and gives you the option to shutdown
#                   immediately. Requires xmessage and bc.

ac_status=$(cat /sys/class/power_supply/AC/online)
now=$(cat /sys/class/power_supply/BAT0/energy_now)
full=$(cat /sys/class/power_supply/BAT0/energy_full)
pct_now=$(echo "$now / $full * 100" | bc -l | sed 's/\.[0-9]*//')

# Percent at which to raise warning.
pct_threshold=10

# If charging, do nothing and exit.
if [[ $ac_status -eq 1 ]]; then
    exit 0
fi

# If more than $PCT_THRESHOLD, do nothing and exit.
if [[ $pct_now -gt $pct_threshold ]]; then
    exit 0
fi

# If discharging and at $PCT_THRESHOLD or below, raise xmessage warning.
DISPLAY=:0 xmessage -center -print "Low battery: $pct_now%."
