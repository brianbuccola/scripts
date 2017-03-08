#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             musicsync.sh
# author:           Brian Buccola
#
# description:      This script transfers music listed in an m3u playlist, with
#                   one song per line and relative paths, from the local
#                   machine to an external mp3 player.

src=$HOME/mnt/floyd/media/music/
dest=$HOME/mnt/usb/MUSIC/
files=$HOME/.mpd/playlists/tmp.m3u
bkupdir=$HOME/.musicsync
log=$bkupdir/log

if [[ ! -d $dest ]]; then
    echo "Error: Destination drive not mounted!"
    exit 0
fi

if [[ ! -d $src ]]; then
    echo "Error: Source drive not mounted!"
    exit 0
fi

if [[ ! -f $files ]]; then
    echo "Error: Cannot find playlist!"
    exit 0
fi

sudo rsync \
    -rvzuhhhP \
    --files-from=$files \
    --log-file=$log \
    $src $dest

exit 0
