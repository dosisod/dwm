#!/bin/sh

wifi_rescan() {
	nmcli d wifi rescan
}

wifi_reboot() {
	nmcli radio wifi off
	nmcli radio wifi on
	printf "" | dmenu -p "Done"
}

wifi_connect() {
	wifi=$(nmcli c | tail -n +2 | dmenu -i -l -1)
	[ -z "$wifi" ] && {
		main;
		exit 0;
	}

	uuid=$(printf "$wifi" | grep -o "........-....-....-....-............")

	err=$(nmcli c up "$uuid" 2>&1)
	[ "$?" = "4" ] && {
		dmenu -p "$err"
		exit 1
	}

	printf "" | dmenu -p "Connection successful"
}

wifi_list() {
	wifi_rescan
	nmcli d wifi list | dmenu -i -l -1
}

main() {
	action=$(printf "Connect\nReboot\nRescan\nList\n" | dmenu -i -l -1 -p "wifi")
	[ -z "$action" ] && exit 0

	case "$action" in
		Connect) wifi_connect ;;
		Reboot) wifi_reboot ;;
		Rescan) wifi_rescan ;;
		List) wifi_list ;;
		*) dmenu -p "Invalid option" ; exit 1 ;;
	esac
}

main
