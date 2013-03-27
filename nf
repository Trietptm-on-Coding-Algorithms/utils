#!/bin/bash
# normalizes file names
if (( $# == 0 )) ; then
	echo "No files specified." >&2
	exit 1
fi

files=("$@")

# The way this function is treated is a bit awkward (passing a file name,
# capturing the function's output in a capture shell, and seting the file name
# variable to the output), but I felt more comfortable writing it like this
# than having `file` be treated as a global variable.
apply_pattern() {
	new_file="$(perl-rename -v "$1" -- "$2" | sed 's/^.*-> //')"

	if [[ "x$new_file" != "x" ]] ; then
		echo -n "$new_file"
	else
		echo -n "$2"
	fi
}

for file in "${files[@]}" ; do
	orig_file="$file"
	file="$(apply_pattern 's/ /-/g'    "$file")"
	file="$(apply_pattern 'y/A-Z/a-z/' "$file")"
	file="$(apply_pattern 's/_/-/g'    "$file")"
	file="$(apply_pattern "s/'//g"     "$file")"
	file="$(apply_pattern 's/"//g'     "$file")"
	file="$(apply_pattern 's/,//g'     "$file")"
	file="$(apply_pattern 's/&/-/g'    "$file")"
	file="$(apply_pattern 's/\(//g'    "$file")"
	file="$(apply_pattern 's/\)//g'    "$file")"
	file="$(apply_pattern 's/://g'     "$file")"
	file="$(apply_pattern 's/\.-/-/g'  "$file")"
	for (( i=0; i<3; i++ )) ; do
		file="$(apply_pattern 's/--/-/g' "$file")"
	done
	echo -n "Renamed '$orig_file' to '$file'"
	if [[ "$orig_file" = "$file" ]] ; then
		echo " (no change)"
	else
		echo
	fi
done
