# Subtitle-Burner
A little bash script to burn (the hardcore way) subtitles into a video file.
## Prerequisites
You need to have an nvida graphic card that supports nvenc encoding. You also need to compile ffmpeg with CUDA enabled (https://developer.nvidia.com/ffmpeg)
Your subtitles have to be *.srt and have the same prefix as the video name. 
## Usage
This is a very simple, yet useful program. Simply run this command:
```./subtitle.sh video.mp4```
