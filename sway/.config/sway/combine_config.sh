#!/bin/bash
cat ~/.config/sway/config.i3config > ~/.config/sway/config
if [ -f ~/.config/sway/device.i3config ]; then
	cat ~/.config/sway/device.i3config >> ~/.config/sway/config
fi
