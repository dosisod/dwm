#!/bin/sh

wifi=$(nmcli c | tail -n +2 | dmenu -i -l -1)
[ -z "$wifi" ] && exit 0

uuid=$(echo "$wifi" | grep -o "........-....-....-....-............")

err=$(nmcli c up "$uuid" 2>&1)
[ "$?" = "4" ] && {
	echo 3
	dmenu -p "$err"
	exit 1
}

echo "" | dmenu -p "Connection successful"
