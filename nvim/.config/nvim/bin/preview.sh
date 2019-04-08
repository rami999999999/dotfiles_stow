#!/bin/bash

mkdir -p /tmp/markdown_notes


while inotifywait -qq -e modify $1 2>>"/tmp/preview.log"; do 
    echo "change detected"
    pandoc --self-contained --css ~/Templates/template.css -s "${1}" -o /tmp/markdown_notes/"${1}".pdf
    
    PID=$(ps aux | grep "mupdf /tmp/markdown_notes/$1" | awk '!/grep/{print $2}')
    if [ -n PID ]; then
        kill -9 "$PID"
    fi

    mupdf /tmp/markdown_notes/"${1}".pdf

done
