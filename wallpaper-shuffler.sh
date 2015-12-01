#!/bin/bash
#
# file:        wallpaper-shuffler.sh
# author:      Brian Buccola
# description: Shuffle through wallpaper collection.
#

wallpaper_dir="${HOME}/pictures/wallpaper-collection"

for f in ${wallpaper_dir}/*; do
  feh --bg-fill "$f"
  sleep 10
done
