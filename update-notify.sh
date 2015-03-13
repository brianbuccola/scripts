#!/bin/bash
#
# List how many updates are available. Useful for putting inside a status bar.

official_updates=$(checkupdates | wc -l)
aur_updates=$(cower -u | wc -l)
echo "Updates: ${official_updates} (${aur_updates})"
