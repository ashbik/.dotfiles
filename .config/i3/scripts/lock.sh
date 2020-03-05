#!/bin/sh
import -window root $HOME/.cache/screenshot.png 
convert -scale 10% -scale 1000% $HOME/.cache/screenshot.png $HOME/.cache/screenshot.png 
i3lock -i $HOME/.cache/screenshot.png &
exit 0 
