#!/bin/bash -xve

exec 2> /tmp/watch_button.log

while sleep 1 ; do
	BUTTONS=$(cat /dev/rtswitch{0,1,2} | tr -d '\n' | tr '10' '01')
	echo ${BUTTONS}
done > /home/ubuntu/a
