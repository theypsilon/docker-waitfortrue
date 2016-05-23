#!/usr/bin/env bash

set -euo pipefail

echo "WAITING FOR [$@] during ${TIMEOUT_SECONDS} seconds"

PIPEOUT="> /dev/null 2>&1"
if [[ "${DEBUG:-false}" == "true" ]] ; then
	echo "DEBUG ON"
	PIPEOUT=""
fi

start_time=$(date +%s)
end_time=$((start_time + TIMEOUT_SECONDS))

while ! eval "$@ $PIPEOUT" ; do
    echo -n "."
    current_time=$(date +%s)
    if (( current_time > end_time )); then
    	echo "!!"
    	echo "FAILED: timeout triggered after ${TIMEOUT_SECONDS} seconds"
    	"$@"
    	exit 1
	fi
    sleep 1s
done
echo "OK"
