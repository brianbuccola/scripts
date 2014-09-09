#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             bkup-home.sh
# author:           Brian Buccola
#
# description:      This script creates a mirror image of $HOME on an external
#                   drive, excluding any files and directories in $EXCL.

SRC=$HOME/mnt/floyd/brian
DEST=$HOME
BKUPDIR=$HOME/.restore-home
EXCL=$BKUPDIR/exclude-list
LOG=$BKUPDIR/log

SCRIPT=$(basename $0)

usage() {
    cat <<EOF

    $SCRIPT options:

    -n
    --dryrun    |   Do dryrun and pipe output to file instead of stdout

    -h
    --help      |   Show this usage page

EOF
}

drive_test() {
    if [[ ! -d $SRC ]]; then
        echo "Error: Drive not mounted!"
        exit 0
    fi
}

bkup() {
    drive_test
    rsync \
        -avuhhh \
        --exclude-from=$EXCL \
        --log-file=$LOG \
        $SRC/ $DEST/
}

bkup_dryrun() {
    drive_test
    echo "Doing dryrun and piping output to $BKUPDIR/dryrun ..."
    rsync \
        -avnuhhh \
        --exclude-from=$EXCL \
        $SRC/ $DEST/ > $BKUPDIR/dryrun
    echo "Done."
}

if [[ $# -eq 0 ]]; then
    bkup
    exit 0
elif [[ $# -eq 1 ]]; then
    case $1 in
              -n) bkup_dryrun && exit 0 ;;
        --dryrun) bkup_dryrun && exit 0 ;;
               *) usage       && exit 0 ;;
    esac
else
    usage && exit 0
fi
