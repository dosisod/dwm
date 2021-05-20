#!/bin/sh

play_song() {
	[ "$@" = ".mp3" ] && return 1
	echo $@ > "/tmp/current_song"

	killall ffplay > /dev/null 2>&1

	$(ffplay -nodisp -autoexit "$MUSIC_DIR/$@" > /dev/null 2>&1 && $($SCRIPT_DIR/next_song.sh))
}

play_song "$@"
