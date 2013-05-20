#!/bin/bash
# Normalizes file names.

if [[ $# = 0 ]] ; then
	echo >&2 "No files specified."
	exit 1
fi

command_exists() {
	command -v $1 &>/dev/null || return 1
}

do_rename() {
	if $dry_run ; then
		extra_flags="-n"
	else
		extra_flags=
	fi

	if command_exists perl-rename ; then
		perl-rename $extra_flags "$@" || rename_failed
	elif  command_exists rename ; then
		# Might be perl rename.
		# TODO: make sure this is perl rename
		rename $extra_flags "$@" || renamed_failed
	else
		echo >&2 "Could not find a perl-rename command."
		exit 1
	fi
}

rename_failed() {
	echo >&2 "Unable to rename a file."
	exit 1
}

noargs=false
spaces_only=false
dry_run=false

for file ; do
	if ! $noargs ; then
		case "$file" in
			-s)
				spaces_only=true
				continue
				;;
			-n)
				dry_run=true
				continue
				;;
			--)
				noargs=true
				continue
				;;
		esac
	fi

	if [[ ! -e "$file" ]] ; then
		echo >&2 "'$file' does not exist"
		continue
	fi

	pattern='s/ /-/g'

	if ! $spaces_only ; then
		# Quoting is strange, but it makes each line consistent.
		# We add each part of the pattern individually to make parts of the patterne easy to comment out.
		pattern="$pattern;"'y/A-Z/a-z/'
		pattern="$pattern;"'s/%20/-/g'
		pattern="$pattern;"'s/_/-/g'
		pattern="$pattern;""s/'//g"
		pattern="$pattern;"'s/"//g'
		pattern="$pattern;"'s/,//g'
		pattern="$pattern;"'s/&/-/g'
		pattern="$pattern;"'s/\(//g'
		pattern="$pattern;"'s/\)//g'
		pattern="$pattern;"'s/://g'
		pattern="$pattern;"'s/\.-/-/g'

		# TODO: make this sane.
		for i in {0..5} ; do
			pattern="$pattern;"'s/--/-/g'
		done
	fi

	do_rename "$pattern" -- "$file"

	if [[ "$orig_file" = "$file" ]] ; then
		echo "'$orig_file' not renamed"
	else
		echo "'$orig_file' renamed to '$file'"
	fi
done
