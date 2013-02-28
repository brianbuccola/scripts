#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             mailsync.sh
# author:           Brian Buccola

PID=$(pgrep offlineimap)

# If offlineimap is running, kill it because after 3min, it's probably frozen.
# -n tests if string is *not* null.
if [[ -n "$PID" ]]; then
    kill $PID
fi

# Run offlineimap [o]nce, with very little output, and send any output to the
# black hole
offlineimap -o -u quiet &>/dev/null &

# Update notmuch
notmuch new

exit 0
