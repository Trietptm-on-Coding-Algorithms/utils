#!/bin/bash

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
	xrandr --verbose | grep 'Brightness:' | cut -d' ' -f2
}

screen=$(xrandr | grep '[^ ]* connected' | sed 's/ connected.*//')
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
