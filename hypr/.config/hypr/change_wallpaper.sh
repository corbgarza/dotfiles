#!/bin/sh
while true; do
		pkill swaybg ; swaybg -i $(find ~/Walls/. -type f | shuf -n1) -m fit &
		sleep 60
done
