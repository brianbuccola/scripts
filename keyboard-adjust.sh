#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             keyboard-adjust.sh
# author:           Brian Buccola
#
# description:      Set up kbd layouts, and switch caps lock with ctrl_L

setxkbmap -layout us,de,it,il -variant dvp,,, # programmers-dvorak kbd primary
setxkbmap -option                             # clear options
setxkbmap -option "grp:shifts_toggle"         # use both shifts to toggle layout
setxkbmap -option "ctrl:swapcaps"             # swap ctrl_L and caps lock
