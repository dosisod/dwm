#!/bin/sh

hours=$(echo -n "0" | dmenu -p "HOURS")
[ -z "$hours" ] && exit 1

minutes=$(echo -n "0" | dmenu -p "MINUTES")
[ -z "$minutes" ] && exit 1

seconds=$(echo -n "0" | dmenu -p "SECONDS")
[ -z "$seconds" ] && exit 1

offset=$(echo "($hours * 3600) + ($minutes * 60) + $seconds" | bc)

while true; do
	echo "$(date -u --date="@$offset" +%T)" > /tmp/timer
	offset=$(echo "$offset - 1" | bc)

	sleep 1

	[ "$(echo "$offset < 0" | bc)" = "1" ] && break
done

rm /tmp/timer
echo "" | dmenu -p "Times up!"
