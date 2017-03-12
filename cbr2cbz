#!/bin/bash
#
# vim:              set ft=sh tw=79 sw=4:
# file:             cbr2cbz.sh
# author:           Brian Buccola
#
# description:      Converts a cbr (comic book rar) file to cbz (comic book
#                   zip) format.

cbr_file=$1
cbz_file="$(basename "${cbr_file}" .cbr).cbz"
start_dir=$(pwd)
temp_dir=$(mktemp -d)

cd "${temp_dir}"
unrar e -inul "${start_dir}/${cbr_file}"
zip -q "${start_dir}/${cbz_file}" *
rm -rf "${temp_dir}"
