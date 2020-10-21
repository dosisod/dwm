#!/bin/bash

current="/home/noot/Music/music/current_song"

make_bar() {
	bar="[ $(/home/noot/git/dwm/scripts/date.sh) ]"

	song=$(cat "$current")
	[ -z "$song" ] || bar="[ ${song%.*} ] $bar"

	echo $bar
}

>$current

make_bar

while true; do
	xsetroot -name "$(make_bar)"
	sleep 1
done