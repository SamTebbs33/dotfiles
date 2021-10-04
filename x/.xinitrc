#!/bin/bash
set DISPLAY ":0"
# Combine common and device i3 config into one file
~/.config/i3/combine_config.sh
exec i3
