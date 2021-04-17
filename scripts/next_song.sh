#!/bin/sh

QUEUE_FILE="/tmp/song_queue"

song=$(head -n 1 "$QUEUE_FILE")
sed -i '1d' "$QUEUE_FILE" > /dev/null

[ "$song" = "" ] && song="$(${SCRIPT_DIR}/random_song.sh)"
echo "$song"

$("${SCRIPT_DIR}/song.sh" "$song") &
