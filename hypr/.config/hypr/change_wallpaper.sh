#!/bin/sh
pkill swaybg ; swaybg -i $(find ~/Walls/. -type f | shuf -n1) -m fit &
