#!/bin/bash
#
# yt-stream.sh
#
# Stream youtube video using mplayer and youtube-dl

video="$1"
cookies_file="/tmp/yt-stream-cookies.txt"

mplayer \
    -fs \
    -cookies \
    -cookies-file "${cookies_file}" \
    $(youtube-dl -g --cookies "${cookies_file}" "${video}")
