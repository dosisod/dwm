#!/bin/sh

song="$(${SCRIPT_DIR}/random_song.sh)"

$("${SCRIPT_DIR}/song.sh" "$song") &
