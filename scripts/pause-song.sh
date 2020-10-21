#!/bin/bash

pid=$(pgrep ffplay | head -n 1)

kill -s $([ "S" == $(ps -q $pid -o state --no-headers) ] && echo "SIGSTOP" || echo "SIGCONT") $pid