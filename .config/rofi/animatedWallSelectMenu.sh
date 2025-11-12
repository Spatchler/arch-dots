# Set some variables
wallDir="${HOME}/.config/wallpapers/"
cacheDir="${HOME}/.cache/jp"

# Create cache dir if not exists
[ -d "$cacheDir" ] || mkdir -p "$cacheDir"

# Same for GIFs but where you only get the first frame
for image in "$wallDir"/*.gif; do
	if [ -f "$image" ]; then
		name=$(basename "$image" .gif)
			if [ ! -f "${cacheDir}/${name}.jpg" ] ; then
				magick "$wallDir/$name.gif[0]" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${name}.jpg"
			fi
    fi
done

# Run rofi
wallSelection=$({ echo -en "Random\x00icon\x1f""$HOME/.config/rofi/RandomThumbnail.png\n" ; find "${wallDir}" -maxdepth 1 -type f \( -iname "*.gif" \) -exec basename {} \; | sort | while read -r A ; do echo -en "$A\x00icon\x1f""${cacheDir}/$(basename $A .gif).jpg\n" ; done; } | rofi -dmenu -theme "$HOME/.config/rofi/wallSelectTheme.rasi")

# Set the wallpaper
[[ -n "$wallSelection" ]] || exit 1
if [ "$wallSelection" == "Random" ]; then
  random=$(ls "${wallDir}" | grep gif | shuf -n 1)
	matugen image ${wallDir}/${random}
else
	matugen image ${wallDir}/${wallSelection}
fi

exit 0


