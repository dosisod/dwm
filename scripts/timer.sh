#!/bin/sh

hours=$(echo -n "0" | dmenu -p "HOURS")
[ -z "$hours" ] && exit 1

minutes=$(echo -n "0" | dmenu -p "MINUTES")
[ -z "$minutes" ] && exit 1

seconds=$(echo -n "0" | dmenu -p "SECONDS")
[ -z "$seconds" ] && exit 1

offset=$(expr "(" $hours '*' 3600 ")" + "(" $minutes '*' 60 ")" + $seconds)

while true; do
	echo "$(date -u --date="@$offset" +%T)" > /tmp/timer
	offset=$(expr $offset - 1)

	sleep 1

	expr $offset "<" 0 && break
done

rm /tmp/timer
echo "" | dmenu -p "Times up!"
