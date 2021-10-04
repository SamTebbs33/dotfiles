#!/bin/bash
cat ~/.config/i3/config.i3config > ~/.config/i3/config
if [ -f ~/.config/i3/device.i3config ]; then
	cat ~/.config/i3/device.i3config >> ~/.config/i3/config
fi
