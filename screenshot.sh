#!/bin/bash
FILENAME="screenshot-`date +%F-%H%M%S`"
grim -g "$(slurp)" ~/Downloads/$FILENAME.png
