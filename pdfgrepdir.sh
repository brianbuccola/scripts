# pdfgrep wrapper that greps all pdfs in given directory for a given pattern

PATTERN="$1"
DIR="$2"

find "$DIR" -name "*.pdf" -exec pdfgrep "$PATTERN" {} +
