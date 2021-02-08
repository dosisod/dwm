#!/bin/bash

# https://www.unix.com/shell-programming-and-scripting/34109-getting-random-file.html
cd "$MUSIC_DIR"
files=(*.mp3)
N=${#files[@]}
((N=RANDOM%N))

echo "${files[$N]}"
