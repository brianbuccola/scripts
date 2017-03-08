#!/bin/bash
#
# vim:          set ft=sh tw=79 sw=4:
# file:         check-wifi.sh
# author:       Brian Buccola
#
# description:  Checks if wifi connection is established. Exits with status 0
#               when yes, otherwise times out and exits with non-0 status.

count=0
timeout=180
e_timeout=70

until [[ -n "$(iwgetid)" ]]; do
    sleep 1
    let "count+=1"
    # wait $timeout seconds, then exit
    if [[ $count -ge $timeout ]]; then
        exit $e_timeout
    fi
done

exit 0
