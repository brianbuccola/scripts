#!/bin/bash

iwconfig wlp1s0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

iwconfig wlp1s0 2>&1 | grep -q ESSID:off && {
  echo "(no wifi)"
  exit 0
}

essid=$(iwconfig wlp1s0 | awk -F '"' '/ESSID/ {print $2}')
quality=$(iwconfig wlp1s0 | awk -F '=' '/Quality/ {print $2}' | cut -d ' ' -f 1)
quality_pct=$(echo "$quality * 100" | bc -l | sed 's/\.[0-9]*//')

echo $essid $quality_pct\%
exit 0
