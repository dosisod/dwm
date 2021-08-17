#!/bin/sh

echo "$(cd "$MUSIC_DIR" && find *.mp3 | sed 's/....$//' | dmenu -c -bw 1 -i -l 25).mp3"
