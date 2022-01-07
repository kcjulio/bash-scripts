#!/bin/bash

clear

while [ 1 ]; do
	hour=$(date | awk '{print $5}' | awk -v RS=: 1 | awk 'FNR == 1' | tr -d '\n')
	minute=$(date | awk '{print $5}' | awk -v RS=: 1 | awk 'FNR == 2' | tr -d '\n')
	second=$(date | awk '{print $5}' | awk -v RS=: 1 | awk 'FNR == 3' | tr -d '\n')

	if [ $hour = 1 ] && [ $minute = 10 ]; then
		shutdown -h now
	fi

	printf "$hour:$minute:$second\r"
	#date | awk '{print $5}' | tr -d '\n'
	#printf '\r'
	sleep 1s
done
