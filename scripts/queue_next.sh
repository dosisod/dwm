#!/bin/sh

song=$("${SCRIPT_DIR}/select_song.sh")

[ "$song" = "" ] || echo "$song" >> "/tmp/song_queue"
