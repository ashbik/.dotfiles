#!/bin/sh

x="xclip -selection c -o"
eval $x
URL=$(eval $x)

DES="$HOME/Videos/YTdl/%(title)s.%(ext)s"

chosenqu=$(echo -e "Best_Quality[video/mp4]\nMid_Quality[video/mp4]\nLowQuality[video/mp4]\naudio" | dmenu -i -p "Select desired format.")

y="youtube-dl --get-filename -o '%(title)s' $URL"
eval $y
FN=$(eval $y)


if [ "$chosenqu" == "Best_Quality[video/mp4]" ]; then

	youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio --merge-output-format mp4 "$URL" -o "$DES" && notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."


elif [ "$chosenqu" == "Mid_Quality[video/mp4]" ]; then
	
	youtube-dl -f 22 "$URL" -o "$DES" && 
	notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."

elif [ "$chosenqu" == "Low_Quality[video/mp4]" ]; then

	youtube-dl -f 135+140 "$URL" -o "$DES" && 
	notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."

elif [ "$chosenqu" == "audio" ]; then

	youtube-dl -f 140 "$URL" -o "$DES" &&
	 notify-send " Download Completed !!! " " ( $FN ) has been downloaded successfully."
else
	 notify-send "Process Aborted !!! " "Could not download video. ( $FN )"
fi



