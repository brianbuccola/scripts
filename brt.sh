#!/bin/bash
#
# file:           brt.sh
# author:         Brian Buccola
#
# description:    Increase screen brightness by `$inc_amt`. Useful for binding
#                 a key to, when your laptop's built-in <Fn-BrightnessUp> key
#                 doesn't work.

max_brightness=255
min_brightness=5
current_brightness=$(cat /sys/class/backlight/radeon_bl0/brightness)
up_amt=20
down_amt=20

brt_change() {
  echo "$1" | sudo tee /sys/class/backlight/radeon_bl0/brightness
}

brt_up() {
  local new_brightness=$(($current_brightness + $up_amt))
  if [[ $new_brightness -le $max_brightness ]]; then
    brt_change "$new_brightness"
  else
    brt_change "$max_brightness"
  fi
}

brt_down() {
  local new_brightness=$(($current_brightness - $up_amt))
  if [[ $new_brightness -ge $min_brightness ]]; then
    brt_change "$new_brightness"
  else
    brt_change "$min_brightness"
  fi
}

if [[ $# -eq 1 ]]; then
  case "$1" in
    [0-9]*) brt_change "$1" && exit 0;;
    up) brt_up && exit 0;;
    down) brt_down && exit 0;;
    *) echo "Error: invalid argument. Pick a brightness level ($min_brightness-$max_brightness), or say 'up' or 'down'." && exit 1;;
  esac
elif [[ $# -eq 0 ]]; then
  echo "Current brightness: $current_brightness."
  exit 0
else
  echo "Error: too many arguments."
  exit 1
fi
