#!/bin/bash

if (( $# == 0 )) ; then
	if xrandr --verbose | sed -n $'/LVDS/,/^[^\t]/p' | grep -q 'Brightness: 1.0' ; then
		set -- 0.3
	else
		set -- 1.0
	fi
fi

xrandr --output LVDS-1 --brightness "$@"
