#!/bin/bash
#
# Shuffle through wallpaper collection
#

wallpaper_dir="${HOME}/pictures/wallpaper-collection"

for f in ${wallpaper_dir}/*; do
  feh --bg-fill "$f"
  sleep 10
done
