#!/bin/sh

if ! `flock -Fn /tmp/ffmpeg_screencast.lock -c "$HOME/bin/i3/ffmpeg_screencast.sh"`; then
	rm /tmp/ffmpeg_screencast.filename
	pkill -f "ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0\.0\+0,0 -f pulse -ac 2 -i alsa_output\.pci-0000_00_1f\.3\.analog-stereo\.monitor -f pulse -i noisefreesource -preset veryfast $(sed 's/\./\\./' /tmp/ffmpeg_screencast.filename)"

fi
