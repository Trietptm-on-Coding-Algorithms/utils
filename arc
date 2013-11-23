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
	*.tar.bzip2)
		tar cjf "$@"
		;;
	*.zip)
		zip -r "$@"
		;;
esac
