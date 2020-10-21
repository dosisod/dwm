#!/bin/bash

music="/home/noot/Music/music"

play_song() {
	[ "$@" == ".mp3" ] && return 1
	echo $@ > "$music/current_song"

	killall ffplay > /dev/null 2>&1

	$(ffplay -nodisp -autoexit "$music/$@" > /dev/null 2>&1 && play_random_song) &
}

play_random_song() {
	$(play_song "$(/home/noot/git/dwm/scripts/random_song.sh)")
}

play_song "$@"