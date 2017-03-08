#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             bkup-home.sh
# author:           Brian Buccola
#
# description:      This script creates a mirror image of $HOME on an external
#                   drive, excluding any files and directories in $EXCL.

src=$HOME
dest=/mnt/floyd
bkupdir=$HOME/.bkup-home
excl=$bkupdir/exclude-list
log=$bkupdir/log

script=$(basename $0)

usage() {
cat <<EOF
usage: $script [option]
options:
  -n, --dryrun  Do dryrun and pipe output to file instead of stdout
  -h, --help    Show this usage page
EOF
}

drive_test() {
    if ! grep -qs $dest /proc/mounts; then
        echo "Error: Drive not mounted!"
        exit 0
    fi
}

bkup() {
    drive_test
    rsync \
        -avuhhh \
        --exclude-from=$excl \
        --delete \
        --delete-excluded \
        --log-file=$log \
        $src $dest
}

bkup_dryrun() {
    drive_test
    echo "Doing dryrun and piping output to $bkupdir/dryrun ..."
    rsync \
        -avnuhhh \
        --exclude-from=$excl \
        --delete \
        --delete-excluded \
        $src $dest > $bkupdir/dryrun
    echo "Done."
}

if [[ $# -eq 0 ]]; then
    bkup
    exit 0
elif [[ $# -eq 1 ]]; then
    case $1 in
        -n|--dryrun) bkup_dryrun && exit 0 ;;
        *) usage && exit 0 ;;
    esac
else
    usage && exit 0
fi
