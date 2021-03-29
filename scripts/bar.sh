#!/bin/bash

make_bar() {
	bar="[ $(/home/noot/git/dwm/scripts/date.sh) ]"

	song=$(cat /tmp/current_song)
	[ -z "$song" ] || bar="[ ${song%.*} ] $bar"

	timer=""
	[ -f /tmp/timer ] && timer=$(cat /tmp/timer)
	[ -z "$timer" ] || bar="[ ${timer%.*} ] $bar"

	echo $bar
}

make_bar

while true; do
	xsetroot -name "$(make_bar)"
	sleep 1
done
