#!/bin/sh

pid=$(pgrep -n ffplay)

signal=$([ "S" = "$(ps -q $pid -o state --no-headers)" ] && echo "STOP" || echo "CONT")

kill -s $signal $pid
