#!/bin/bash
#
# file:          mpv-wrapper.sh
# author:        Brian Buccola
#
# description:   Stream videos using mpv/youtube-dl. Useful for binding a key
#                to in a browser capable of running external shell scripts.

mpv --fs "$(xsel)"
