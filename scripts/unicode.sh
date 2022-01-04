#!/bin/bash

echo -en "\U$(dmenu -p "U+" <<< '' )" | xclip -sel clipboard
