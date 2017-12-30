#!/bin/sh
#Record with ffmpeg and keep updating i3blocks

file=$HOME/Videos/screencast/$(date +%s).mp4
echo "$file">/tmp/ffmpeg_screencast.filename

ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 -f pulse -ac 2 \
    -i "alsa_output.pci-0000_00_1f.3.analog-stereo.monitor" -f pulse \
    -i "noisefreesource"\
    -preset veryfast \
	"$file" & pid=$!

while kill -0 "$pid"; do
	pkill -RTMIN+4 i3blocks
	sleep 2
done
