#!/bin/sh

x="xclip -selection c -o"
eval $x
URL=$(eval $x)

DES="$HOME/Videos/Youtube/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"

chosenqu=$(echo -e "1080p\n720p\n480p\naudio" | dmenu -i -p "Select desired format.")

y="youtube-dl --get-filename -o '%(title)s' $URL"
eval $y
FN=$(eval $y)


if [ "$chosenqu" == "1080p" ]; then
	youtube-dl -f 137+140 "$URL" -o "$DES" && notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."
elif [ "$chosenqu" == "720p" ]; then
	youtube-dl -f 22 "$URL" -o "$DES" && notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."
elif [ "$chosenqu" == "480p" ]; then
	youtube-dl -f 135+140 "$URL" -o "$DES" && notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."
elif [ "$chosenqu" == "audio" ]; then
	youtube-dl -f 140 "$URL" -o "$DES" && notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."
else
	 notify-send "Process Aborted !!! " "Could not download video. ( $FN )"
fi



