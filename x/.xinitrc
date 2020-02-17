#!/bin/bash
set DISPLAY ":0"
if [[ $(hostname) = "sam-pc-arch" ]]; then
	xrandr --output DP-2 --mode 1920x1080 --rate 144.0 --brightness 0.8
	setxkbmap -layout gb
fi
exec i3
