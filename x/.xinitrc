#!/bin/bash
set DISPLAY ":0"
if [[ $(hostname) = "sam-pc-arch" ]]; then
	xrandr --output DP-4 --mode 1920x1080 --rate 144.0 --brightness 0.8
	xrandr --output HDMI-0 --left-of DP-4
	setxkbmap -layout gb
fi
if [[ $(hostname) = "sam-mbp-arch" ]]; then
	setxkbmap -layout gb -variant mac
fi
exec i3
