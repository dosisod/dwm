#!/bin/sh

play_song() {
	[ "$@" = ".mp3" ] && return 1
	echo $@ > "/tmp/current_song"

	killall ffplay > /dev/null 2>&1

	$(ffplay -nodisp -autoexit "$MUSIC_DIR/$@" > /dev/null 2>&1 && play_random_song) &
}

play_random_song() {
	$(play_song "$($SCRIPT_DIR/random_song.sh)")
}

play_song "$@"
