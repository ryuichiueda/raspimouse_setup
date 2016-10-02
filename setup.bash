#!/bin/bash -xve

#exec 2> /tmp/setup.log

cd ~/RaspberryPiMouse/src/drivers/
/sbin/insmod rtmouse.ko

sleep 1                   #すぐにはデバイスファイルができないので待つ
chmod 666 /dev/rt*

echo 0 > /dev/rtmotoren0  #安全のためモータの電源を切っておく

$(dirname $0)/watch_switches.bash
