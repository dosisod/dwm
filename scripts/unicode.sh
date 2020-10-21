#!/bin/bash

echo -en "\u$(dmenu -p "U+" <<< '' )" | xclip -sel clipboard