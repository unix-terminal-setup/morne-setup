#!/bin/bash

URL=google.com
PORT_TO_SCAN=443
CHECK_INTERVAL=1.5

MELLOW_GREEN='\033[38;5;120m'
MELLOW_RED='\033[38;5;167m'
MELLOW_GREY='\033[38;5;243m'
MELLOW_LIGHT_BLUE='\033[38;5;110m'
NC='\033[0m'

MISSED_SCANS=0
SUCCESS_SCANS=0

function print_headers_and_clear {
	clear
	echo -e "${MELLOW_LIGHT_BLUE}✨ Internet checker is currently running${NC}\n"
}

function print_stats {
	echo -e "\n${MELLOW_GREY}ℹ Successful scans: ${SUCCESS_SCANS}${NC}"
	echo -e "${MELLOW_GREY}ℹ Failed scans: ${MISSED_SCANS}${NC}"
	echo -e "${MELLOW_GREY}ℹ Total scans: $((MISSED_SCANS + SUCCESS_SCANS))${NC}"
	echo -e "\n${MELLOW_GREY}Press Ctrl+C to stop.${NC}"
}


while true
do
	if nc -zw1 $URL $PORT_TO_SCAN; then
		print_headers_and_clear
		echo -e "${MELLOW_GREEN}● Internet connection working normally.${NC}"
		SUCCESS_SCANS=$((SUCCESS_SCANS + 1))
	else
		print_headers_and_clear
		echo -e "${MELLOW_RED}✘ Internet is down. Please panic now.${NC}"
		MISSED_SCANS=$((MISSED_SCANS + 1))
	fi
	print_stats
	sleep $CHECK_INTERVAL
done
