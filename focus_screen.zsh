#!/usr/bin/env zsh

dimensions=$(xdpyinfo | grep dimensions | awk '{print $2}')  # for a 2 monitor setup (each running 1920x1080), and with xinamera this will return "3840x1080"
width=$(echo $dimensions | sed -r 's/([0-9]+)x[0-9]+/\1/')
height=$(echo $dimensions | sed -r 's/[0-9]+x([0-9]+)/\1/')

case $1 in
  --left)
      xdotool mousemove $(($width / 4)) $(($height / 2)) # move mouse to center of left screen
      xdotool click 1 # Click mouse1 to set focus
    ;;
  --right)
      xdotool mousemove $(( $width * 3 / 4)) $(( $height / 2 ))
      xdotool click 1 
    ;;
esac
