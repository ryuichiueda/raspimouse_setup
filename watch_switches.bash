#!/bin/bash -xve

exec 2> /tmp/watch_button.log

while sleep 1 ; do
	BUTTONS=$(cat /dev/rtswitch{0,1,2} | tr -d '\n' | tr '10' '01')
	case "$BUTTONS" in
	"100" ) echo 1 > /dev/rtmotoren0 ;;
	"010" ) /home/ubuntu/run ;;
	"001" ) echo 0 > /dev/rtmotoren0 ;;
	"111" ) shutdown -h now ;;
	* ) echo ERROR ;;
	esac
done
