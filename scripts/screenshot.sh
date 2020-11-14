#!/bin/bash

attempt_screenshot() {
	echo $(gnome-screenshot -a 2>&1)
}

# gnome-screenshot fails sometimes, so re-run it until it succeeds
[[ "$(attempt_screenshot)" == *"gdk_pixbuf"* ]] && attempt_screenshot