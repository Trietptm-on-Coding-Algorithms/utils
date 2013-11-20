#!/bin/bash

case "$1" in
	*.tar)
		tar cf "$@"
		;;
	*.tar.gz|*.tgz)
		tar czf "$@"
		;;
	*.tar.xz)
		tar cJf "$@"
		;;
	*.zip)
		zip -r "$@"
		;;
esac
