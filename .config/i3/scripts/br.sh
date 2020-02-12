#!/bin/sh

case "$1" in
    Gmail)
        chromium --app="https://www.gmail.com"
        ;;
    Coursera)
        chromium --app="https://www.coursera.org"
        ;;
    YouTube)
        firefox --kiosk https://www.youtube.com
        ;;

    Reddit)
        opera https://www.youtube.com
        ;;
    *)
        notify-send "Go nowhere?? good choice too!!"
        exit 2
esac

exit 0
