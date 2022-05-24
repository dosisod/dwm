#!/bin/sh

BACKGROUND_DIR=~/Pictures/wallpapers

cd "$BACKGROUND_DIR"

msg() {
	printf "" | dmenu -p "$1"
}

background_select() {
	find . -type f | sort | dmenu -i -l 25
}

background_set() {
	background="$(background_select)"
	[ -z "$background" ] && exit 1;

	feh --no-fehbg --bg-fill "$BACKGROUND_DIR/$background"
}

background_rename() {
	background="$(background_select)"
	[ -z "$background" ] && exit 1;

	new_name=$(printf "" | dmenu -it "$background")
	[ -z "$new_name" ] && exit 1;

	mv "$BACKGROUND_DIR/$background" "$BACKGROUND_DIR/$new_name"
}

background_remove() {
	background="$(background_select)"
	[ -z "$background" ] && exit 1;

	rm "$BACKGROUND_DIR/$background"
}

main() {
	action=$(printf "set\nrename\nremove\n" | dmenu -i -l 10 -p "background")
	[ -z "$action" ] && exit 0

	case "$action" in
		set) background_set ;;
		rename) background_rename ;;
		remove) background_remove ;;
		*) msg "Invalid option" ; exit 1 ;;
	esac
}

main
