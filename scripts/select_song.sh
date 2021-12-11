#!/bin/sh

cd "$MUSIC_DIR"

find *.mp3 | sed 's/....$//' | ~/git/dmenu/dmenu -c -bw 1 -i -l 25 | sed -e '/^$/d' -e 's/$/.mp3/'
