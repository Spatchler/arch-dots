#!/bin/bash

swww img $1 --transition-type center --transition-step 15 --transition-fps 60

if [ -d "~/.config/wallpapers/CURRENT" ]; then
  ln -s $1 ~/.config/wallpapers/CURRENT
else
  ln -sf $1 ~/.config/wallpapers/CURRENT
fi

