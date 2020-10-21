#!/bin/bash

music="/home/noot/Music/music"

# https://www.unix.com/shell-programming-and-scripting/34109-getting-random-file.html
cd $music
files=(*.mp3)
N=${#files[@]}
((N=RANDOM%N))

echo "${files[$N]}"