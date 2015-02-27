#!/bin/bash
#
# List how many updates are available. Useful for putting inside a status bar.

echo "Updates: $(checkupdates | wc -l)"
