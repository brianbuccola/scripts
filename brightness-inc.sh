#!/bin/bash
#
# file:           brightness-inc.sh
# author:         Brian Buccola
#
# description:    Increase screen brightness by `$inc_amt`. Useful for binding
#                 a key to, when your laptop's built-in <Fn-BrightnessUp> key
#                 doesn't work.

max_brightness=255
min_brightness=5
current_brightness=$(cat /sys/class/backlight/radeon_bl0/brightness)
inc_amt=20
new_brightness=$(echo $(($current_brightness + $inc_amt)))

if [[ $new_brightness -gt $max_brightness ]]; then
  echo $max_brightness | sudo tee /sys/class/backlight/radeon_bl0/brightness
elif [[ $new_brightness -lt $min_brightness ]]; then
  echo $min_brightness | sudo tee /sys/class/backlight/radeon_bl0/brightness
else
  echo "$new_brightness" | sudo tee /sys/class/backlight/radeon_bl0/brightness
fi
