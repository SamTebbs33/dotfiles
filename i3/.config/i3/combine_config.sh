#!/bin/bash
cat ~/.config/i3/config.i3 > ~/.config/i3/config
if [ -f ~/.config/i3/device.i3 ]; then
	cat ~/.config/i3/device.i3 >> ~/.config/i3/config
fi
