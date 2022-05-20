#!/bin/bash

# Make a video from gallery
# Arguments: PATH [FRAMERATE]

[ -z $1 ] && echo "Path missing" && exit || cd $1
[ -2 $2 ] && FRAMERATE=25 || FRAMERATE=$2

ffmpeg -framerate $FRAMERATE -pattern_type glob -i "*.jpg" glitch.mp4
