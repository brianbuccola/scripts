#!/bin/bash
#
# pdfgrep wrapper that greps all pdfs in given directory for a given pattern
#
pattern="$1"
dir="$2"

find "$dir" -name "*.pdf" -exec pdfgrep "$pattern" {} +
