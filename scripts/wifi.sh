#!/bin/sh

msg() {
	printf "" | dmenu -p "$1"
}

wifi_rescan() {
	nmcli device wifi rescan
}

wifi_reboot() {
	nmcli radio wifi off
	nmcli radio wifi on
	msg "Done"
}

wifi_connect() {
	wifi=$(nmcli connection | tail -n +2 | dmenu -i -l -1)
	[ -z "$wifi" ] && {
		main;
		exit 0;
	}

	uuid=$(printf "$wifi" | grep -o "........-....-....-....-............")

	err=$(nmcli connection up "$uuid" 2>&1)
	[ "$?" = "4" ] && {
		msg "$err"
		exit 1
	}

	msg "Connection successful"
}

wifi_new_connection() {
	wifi=$(wifi_list)

	[ -z "$wifi" ] && {
		main;
		exit 0;
	}

	bssid=$(printf "$wifi" | grep -o "..:..:..:..:..:..")
	password=$(msg "Password")

	expr "${#password}" ">" 8 > /dev/null
	[ "$?" = "1" ] && {
		msg "Supplied password was too short"
		main;
		exit 0;
	}

	nmcli device wifi connect "$bssid" password "$password"

	[ "$?" = "0" ] || {
		msg "Could not make connection"
		exit 1;
	}

	msg "Connection successful"
}

wifi_list() {
	wifi_rescan
	nmcli device wifi list | dmenu -i -l -1
}

main() {
	action=$(printf "Connect\nNew Connection\nReboot\nRescan\nList\n" | dmenu -i -l -1 -p "wifi")
	[ -z "$action" ] && exit 0

	case "$action" in
		Connect) wifi_connect ;;
		"New Connection") wifi_new_connection ;;
		Reboot) wifi_reboot ;;
		Rescan) wifi_rescan ;;
		List) wifi_list ;;
		*) msg "Invalid option" ; exit 1 ;;
	esac
}

main
