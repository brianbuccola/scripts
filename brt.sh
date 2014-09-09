#!/bin/bash

max_brightness=255
min_brightness=5
current_brightness=$(cat /sys/class/backlight/radeon_bl0/brightness)
up_amt=20
down_amt=20

brt_change() {
  local amt=$1
  echo "$amt" | sudo tee /sys/class/backlight/radeon_bl0/brightness
}

brt_up() {
  local new_brightness=$(($current_brightness + $up_amt))
  brt $new_brightness
}

brt_down() {
  local new_brightness=$(($current_brightness - $up_amt))
  brt $new_brightness
}

exceeds_max() {
  local new_brightness=$1
  if [[ $new_brightness -gt $max_brightness ]]; then
    exit 0
  else
    exit 1
  fi
}

exceeds_min() {
  local new_brightness=$1
  if [[ $new_brightness -lt $max_brightness ]]; then
    exit 0
  else
    exit 1
  fi
}

if [[ $# -eq 1 ]]; then
  case $1 in
    ^[0-9]*) brt_change "$1" && exit 0;;
    up) brt_up;;
    down) brt_down;;
    *) echo "blah" && exit 1;;
  esac
else
  echo "BLAH" && exit 1
fi
