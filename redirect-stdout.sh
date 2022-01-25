#!/bin/bash

while [ 1 ]; do
	echo 'RAM:' > /dev/ttyUSB0
	free -h | grep Mem | awk '{print "   Used: "$3"\n   Free: "$4}' > /dev/ttyUSB0

	echo 'Uptime:' > /dev/ttyUSB0
	uptime | awk '{print "   "$3}' | tr -d , > /dev/ttyUSB0
	sleep 10s
done
