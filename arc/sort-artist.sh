for file in *
do
	artist="$(exiftool -b -Artist $file)"
	if [[ ! -z $artist ]] ; then
		[[ -d "$artist" ]] || mkdir -- "$artist"
		mv -- "$file" "$artist"
	else
		echo "No artist for $file"
	fi
done
