#!/bin/bash

# Create montage from gallery

# Arguments: PATH [WIDTH]

[ -z $1 ] && echo "Path missing" && exit || GLITCH_PATH="$1"
[ -z $2 ] && WIDTH=1024
[ -z $3 ] && SIZE=256


feh $GLITCH_PATH -montage -W $WIDTH --thumb-width $SIZE --thumb-heigh $SIZE -o $GLITCH_PATH/montage.jpg
file $GLITCH_PATH/montage.jpg
