#!/bin/bash
#
# vim               set ft=sh tw=79:
# file:             check-ip.sh
# author:           Brian Buccola
#
# description:      Check if dynamic ip address has changed.

CURRENT_IP="$(cat $HOME/.current_ip)"
NEW_IP="$(curl -s www.icanhazip.com)"

[[ -z "$NEW_IP" ]] && exit 1

if [[ ${CURRENT_IP} = ${NEW_IP} ]]; then
    exit 0
else
    xmessage -center -print "IP has changed. New IP is: ${NEW_IP}."
    exit 0
fi
