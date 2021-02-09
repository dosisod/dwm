#!/bin/sh

pid=$(pgrep ffplay | head -n 1)

signal=$([ "S" = "$(ps -q $pid -o state --no-headers)" ] && echo "STOP" || echo "CONT")

kill -s $signal $pid
