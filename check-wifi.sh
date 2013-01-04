#!/bin/bash
#
# vim:          set ft=sh tw=79 sw=4:
# file:         check-wifi.sh
# author:       Brian Buccola
#
# description:  Checks if wifi connection is established. Exits with status 0
#               when yes, otherwise times out and exits with non-0 status.

COUNT=0
TIMEOUT=180
E_TIMEOUT=70

until [[ -n "$(iwgetid)" ]]; do
    sleep 1
    let "COUNT+=1"
    # wait $TIMEOUT seconds, then exit
    if [[ $COUNT -ge $TIMEOUT ]]; then
        exit $E_TIMEOUT
    fi
done

exit 0
