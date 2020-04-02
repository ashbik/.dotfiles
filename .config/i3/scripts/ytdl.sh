#!/bin/sh

x="xclip -selection c -o"
eval $x
URL=$(eval $x)

DES="$HOME/Videos/YTdl/%(title)s.%(ext)s"

SE=$(echo -e "Best_Quality[video/mp4]\nMid_Quality[video/mp4]\nLowQuality[video/mp4]\naudio\nStream(1080p)" | dmenu -i -p "Select desired format.")
FN="find $HOME/Videos/YTdl/ -type f -cmin -0.10 | grep "YTdl/" | cut -d"/" -f6"


if [ "$SE" == "Best_Quality[video/mp4]" ]; then

        youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio --merge-output-format mp4 "$URL" -o "$DES" && 
	notify-send " Download Complete. " "`eval $FN`"


elif [ "$SE" == "Mid_Quality[video/mp4]" ]; then

        youtube-dl -f 22 "$URL" -o "$DES" &&
        notify-send " Download Complete. " "`eval $FN`"

elif [ "$SE" == "Low_Quality[video/mp4]" ]; then

        youtube-dl -f 135+140 "$URL" -o "$DES" &&
        notify-send " Download Complete. " "`eval $FN`"

elif [ "$SE" == "audio" ]; then

        youtube-dl -f 140 "$URL" -o "$DES" &&
         notify-send " Download Complete. " "`eval $FN`"

elif [ "$SE" == "Stream(1080p)" ]; then
	    notify-send " Streaming $URL locally."
        mpv --ytdl-format=bestvideo[height=1080]+bestaudio/best --geometry=70%x70%  "$URL" &&
        notify-send "  Streaming Closed."
else
         notify-send " Process Stopped. " "Could not download the url $URL."
fi

