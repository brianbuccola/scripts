#!/bin/bash
#
# vim:              set ft=sh tw=79:
# file:             check-ip.sh
# author:           Brian Buccola
#
# description:      Check if dynamic ip address has changed.

ip_list="${HOME}/.ip_list"
current_ip="$(curl -s www.icanhazip.com)"

[[ -z "${current_ip}" ]] && exit 1

# If current IP is not in IP list...
if ! grep -Fxq "${current_ip}" "${ip_list}"; then
  # ...then display message and exit.
  DISPLAY=:0 xmessage -center -print "New IP discovered: ${current_ip}."
  exit 0
else
  exit 0
fi
