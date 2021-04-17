#!/bin/sh

echo "$(cd "$MUSIC_DIR" && find *.mp3 | rev | cut -b 5- | rev | dmenu -i -l 25).mp3"
