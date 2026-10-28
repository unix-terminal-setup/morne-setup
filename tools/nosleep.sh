#!/bin/bash
cleanup() {
    echo "Stopping caffeinate..."
    killall caffeinate 2>/dev/null
    exit
}

trap cleanup INT TERM EXIT

caffeinate -d &
while true
do
    osascript -e 'tell application "Microsoft Teams" to activate'
    osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
    echo "Teams Status Refreshed"
    sleep 300
done
