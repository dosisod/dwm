#!/bin/sh

songs=$("${SCRIPT_DIR}/select_song.sh")

[ "$songs" = "" ] && exit 1

echo "$songs" >> "/tmp/song_queue"
