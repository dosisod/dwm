#!/bin/sh

mkdir -p "$MUSIC_DIR/playlist"

msg() {
	printf "" | dmenu -p "$1"
}

playlist_select() {
	echo "$(find "$MUSIC_DIR/playlist" -type f -printf '%f\n' | dmenu)"
}

playlist_add() {
	playlist="$(playlist_select)"

	[ -z "$playlist" ] && {
		main
		exit 0
	}

	playlist_file=$MUSIC_DIR/playlist/$playlist

	"$SCRIPT_DIR/select_song.sh" >> "$playlist_file"
	sort -u -o "$playlist_file" "$playlist_file"

}

playlist_new() {
	name=$(printf "" | dmenu -p "playlist name")

	touch "$MUSIC_DIR/playlist/$name"

	main
	exit 0
}

main() {
	action="$(printf "shuffle\nadd song\nnew" | dmenu -i -l -1 -p "playlist")"
	[ -z "$action" ] && exit 0

	case "$action" in
		shuffle) playlist_shuffle ;;
		"add song") playlist_add ;;
		new) playlist_new ;;
		*) msg "Invalid option" ; exit 1 ;;
	esac
}

main
