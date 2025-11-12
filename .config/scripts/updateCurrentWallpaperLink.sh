#!/bin/bash

path=$(swww query | awk '{print $9}')
echo $path
if [ -d "~/.config/wallpapers/CURRENT" ]; then
  ln -s $path ~/.config/wallpapers/CURRENT
else
  ln -sf $path ~/.config/wallpapers/CURRENT
fi

