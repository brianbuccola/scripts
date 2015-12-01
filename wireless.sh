#!/bin/bash
#
# file: wireless.sh
# author: Brian Buccola
#
# description:    Output connection status (whether connected to ethernet,
#                 or to wifi, or to nothing). Useful for putting in a status
#                 bar. Relies on `iwconfig`, which requires root privileges to
#                 output full info.

sudo iwconfig wlp1s0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

sudo iwconfig wlp1s0 2>&1 | grep -q ESSID:off && {
  echo "(no wifi)"
  exit 0
}

essid=$(sudo iwconfig wlp1s0 | awk -F '"' '/ESSID/ {print $2}')
quality=$(sudo iwconfig wlp1s0 | awk -F '=' '/Quality/ {print $2}' | cut -d ' ' -f 1)
quality_pct=$(echo "$quality * 100" | bc -l | sed 's/\.[0-9]*//')

echo $essid $quality_pct\%
exit 0
