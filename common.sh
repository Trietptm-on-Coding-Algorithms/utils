error() {
	echo >&2 "$@"
}

# Never returns
die() {
	error "$@"
	exit 1
}

needs() {
	local extra_error
	while [[ -n $1 ]] ; do
		case "$1" in
			-e) extra_error="$2" ;  shift ;;
			root) (( $UID == 0 )) || die "Must be root. $extra_error" ;;
			*) command -v "$1" &>/dev/null || die "Needs $1. $extra_error" ;;
		esac
		shift
	done
}
