#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             musicsync.sh
# author:           Brian Buccola
#
# description:      This script transfers music listed in an m3u playlist, with
#                   one song per line and relative paths, from the local
#                   machine to an external mp3 player.

SRC=$HOME/mnt/floyd/media/music/
DEST=$HOME/mnt/usb/MUSIC/
FILES=$HOME/.mpd/playlists/tmp.m3u
BKUPDIR=$HOME/.musicsync
LOG=$BKUPDIR/log

if [[ ! -d $DEST ]]; then
    echo "Error: Destination drive not mounted!"
    exit 0
fi

if [[ ! -d $SRC ]]; then
    echo "Error: Source drive not mounted!"
    exit 0
fi

if [[ ! -f $FILES ]]; then
    echo "Error: Cannot find playlist!"
    exit 0
fi

sudo rsync \
    -rvzuhhhP \
    --files-from=$FILES \
    --log-file=$LOG \
    $SRC $DEST

exit 0
