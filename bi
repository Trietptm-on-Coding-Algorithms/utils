#!/bin/bash
# Changes X brightness
# by Evan Teitelman <teitelmanevan@gmail.com>

default_inc=0.1

err() {
	echo >&2 "$*"
}

inc() {
	val=$1
	bright=$({ echo 'scale=2'; echo "$(get)+$val"; } | bc)
	set $bright
}

set() {
	local bright=$1
	xrandr --output "$screen" --brightness "$bright"
}

get() {
	stdbuf -o0 xrandr --verbose | awk '/Brightness/ { print $2; exit }'
}

screen=$(stdbuf -o0 xrandr | awk '/^[^ ]* connected/ { print $1; exit }')
err "screen: $screen"

case "$1" in
	'')
		if [[ $(get) == 1.0 ]] ; then
			set 0.5
		else
			set 1.0
		fi
		;;
	+*)
		val=${1#+}
		[[ -z "$val" ]] && val=$default_inc
		inc $val
		;;
	-*)
		val=${1#-}
		[[ -z "$val" ]] && val=$default_inc
		inc -$val
		;;
	get)
		get
		;;
	*)
		set "$1"
		;;
esac
