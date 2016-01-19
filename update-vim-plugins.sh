#!/bin/bash
#
# file:           update-vim-plugins.sh
# author:         Brian Buccola
#
# description:    Update each vim plugin inside ~/.vim/bundle.

cd ~/.vim/bundle || exit 1
i=1
for d in *; do
  cd "$d"
  echo "$i. $d:"
  git pull
  cd ..
  ((i++))
done

