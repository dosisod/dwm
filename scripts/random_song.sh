#!/bin/sh

cd "$MUSIC_DIR"
echo "$(find . -name '*.mp3' | shuf -n1 | cut -c 3-)"
