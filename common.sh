error() {
	echo >&2 "$@"
}

# Never returns
die() {
	error "$@"
	exit 1
}

needs() {
	local item
	local extra_error
	while [[ -n $1 ]] ; do
		case "$1" in
			-e) extra_error="$2" ;  shift ;;
			root) (( $UID == 0 )) || die "Must be root. $extra_error" ;;
			*) command -v "$item" &>/dev/null || die "Needs $item. $extra_error" ;;
		esac
		shift
	done
}
