#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             bkup-webpage.sh
# author:           Brian Buccola
#
# description:      This script creates a remote mirror of the local webpage
#                   directory.

SRC="$HOME/webpage/"
DEST="brian.buccola@people.linguistics.mcgill.ca:/home/bbucco/public_html/"
EXCL="$HOME/webpage/.bkup-webpage/exclude-list"
LOG="$HOME/webpage/.bkup-webpage/log"

rsync \
    -avhhh -e "ssh -i $HOME/.ssh/id_rsa.mcgill" \
    --exclude-from=$EXCL \
    --log-file=$LOG \
    $SRC $DEST
