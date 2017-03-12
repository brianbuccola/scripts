#!/bin/bash
#
# file:           update-notify.sh
# author:         Brian Buccola
#
# description:    List how many updates are available. Useful for putting
#                 inside a status bar.

official_updates=$(checkupdates | wc -l)
aur_updates=$(cower -uq | wc -l)
echo "Updates: ${official_updates} (${aur_updates})"
