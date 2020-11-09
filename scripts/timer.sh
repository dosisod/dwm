#!/bin/bash

hours=$(dmenu -p "HOURS" <<< "0")
[ -z "$hours" ] && exit 1

minutes=$(dmenu -p "MINUTES" <<< "0")
[ -z "$minutes" ] && exit 1

seconds=$(dmenu -p "SECONDS" <<< "0")
[ -z "$seconds" ] && exit 1

offset=$(( ($hours * 3600 ) + (minutes * 60) + (seconds) ))

for ((;;)); do
	echo "$(date -u --date="@$offset" +%T)" > /tmp/timer
	offset=$(( $offset - 1))
	sleep 1

	(( $offset < 0 )) && rm /tmp/timer && exit 1
done
