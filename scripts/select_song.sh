#!/bin/sh

cd "$MUSIC_DIR"

find *.mp3 | sed 's/....$//' | dmenu -c -bw 1 -i -l 25 | sed -e '/^$/d' -e 's/$/.mp3/'
