#!/bin/bash

backgroundColor=$(cat "$HOME/.config/rofi/colors/matugen.rasi" | awk '{print $2}' | awk 'NR==2'| cut -c 1-7)
magick "$HOME/.config/rofi/RandomThumbnailSource.png" -fill "${backgroundColor}" -fuzz 20% -draw 'color 0,0 floodfill' "$HOME/.config/rofi/RandomThumbnail.png"
# magick "$HOME/.config/rofi/RandomThumbnailSource.png" -fill "transparent" -fuzz 20% -draw 'color 0,0 floodfill' "$HOME/.config/rofi/RandomThumbnail.png"

