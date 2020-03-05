#!/bin/sh
import -window root $HOME/.cache/sc.png 
convert $HOME/.cache/sc.png -channel RGB -blur 0x4 -gravity center $HOME/Cloud/Images/Wall/lock.png -composite $HOME/.cache/sc.png   
i3lock -i $HOME/.cache/sc.png &
exit 0 
