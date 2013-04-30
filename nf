#!/bin/bash
# normalizes file names
if [[ $# = 0 ]] ; then
	echo "No files specified." >&2
	exit 1
fi

# The way this function is treated is a bit awkward (passing a file name,
# capturing the function's output in a capture shell, and seting the file name
# variable to the output), but I felt more comfortable writing it like this
# than having `file` be treated as a global variable.
apply_pattern() {
	if $dry_run ; then
		new_file=$(perl-rename -vn "$1" -- "$2" | sed 's/^.*-> //')
	else
		new_file=$(perl-rename -v "$1" -- "$2" | sed 's/^.*-> //')
	fi

	if [[ "x$new_file" != "x" ]] ; then
		echo -n "$new_file"
	else
		echo -n "$2"
	fi
}

noargs=false
spaces_only=false
dry_run=false

for file ; do
	if ! $noargs ; then
		if [[ "$file" = -s ]] ; then
			spaces_only=true
			continue
		elif [[ "$file" = -- ]] ; then
			noargs=true
			continue
		elif [[ "$file" = -n ]] ; then
			dry_run=true
			continue
		fi
	fi

	if [[ ! -f "$file" && ! -d "$file" ]] ; then
		echo "'$file' does not exist" >&2
		continue
	fi

	orig_file="$file"
	file=$(apply_pattern 's/ /-/g'    "$file")
	if ! $spaces_only ; then
		file=$(apply_pattern 'y/A-Z/a-z/' "$file")
		file=$(apply_pattern 's/_/-/g'    "$file")
		file=$(apply_pattern "s/'//g"     "$file")
		file=$(apply_pattern 's/"//g'     "$file")
		file=$(apply_pattern 's/,//g'     "$file")
		file=$(apply_pattern 's/&/-/g'    "$file")
		file=$(apply_pattern 's/\(//g'    "$file")
		file=$(apply_pattern 's/\)//g'    "$file")
		file=$(apply_pattern 's/://g'     "$file")
		file=$(apply_pattern 's/\.-/-/g'  "$file")
	fi
	for i in $(seq 1 3) ; do
		file=$(apply_pattern 's/--/-/g' "$file")
	done

	if [[ "$orig_file" = "$file" ]] ; then
		echo "'$orig_file' not renamed"
	else
		echo "'$orig_file' renamed to '$file'"
	fi
done
