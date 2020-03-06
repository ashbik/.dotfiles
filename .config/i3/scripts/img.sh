#!/bin/sh

case "$1" in
    Wallpapers)
        sxiv -t $HOME/Cloud/Images/Wall/
        ;;
    Gifs)
        sxiv -t -a $HOME/Cloud/Images/Animation/
        ;;
    Images)
        sxiv -t $HOME/Cloud/Images/
        ;;
    *)
        notify-send "Go nowhere?? good choice too!!"
        exit 2
esac

exit 0
