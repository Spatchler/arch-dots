# Set some variables
wallDir="${HOME}/.config/wallpapers/"
cacheDir="${HOME}/.cache/jp"

# Create cache dir if not exists
[ -d "$cacheDir" ] || mkdir -p "$cacheDir"

# Convert images in directory and save to cache dir
for image in "$wallDir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$image" ]; then
		name=$(basename "$image")
			if [ ! -f "${cacheDir}/${name}" ] ; then
				magick "$image" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${name}"
			fi
    fi
done

# Run rofi
wallSelection=$({ echo -en "Random\x00icon\x1f""$HOME/.config/rofi/RandomThumbnail.png\n" ; find "${wallDir}" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do echo -en "$A\x00icon\x1f""${cacheDir}/$A\n" ; done; } | rofi -dmenu -theme "$HOME/.config/rofi/wallSelectTheme.rasi")

# Set the wallpaper
[[ -n "$wallSelection" ]] || exit 1
if [ "$wallSelection" == "Random" ]; then
	random=$(fd . "${wallDir}" -e jpg -e png -e jpeg -e webp | shuf -n 1)
	matugen image ${random}
else
	matugen image ${wallDir}/${wallSelection}
fi

exit 0

