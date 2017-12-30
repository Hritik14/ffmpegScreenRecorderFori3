# Simple screen recorder for i3

Add a bindsym to toggle_ffmpeg_screencast.sh in i3config
Ex: `bindsym XF86AudioStop exec /PATH/TO/toggle_ffmpeg_screencast.sh`

Put this in `~/.i3blocks.conf` (if you are using)
```
[screencast]
interval=once
label=🔴
signal=4 # Emitted by ffmpeg_screencast.sh
```

