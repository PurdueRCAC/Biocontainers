#!/bin/bash
# ----------------------------------------------------------------------
# bioc_pull2sif.sh - Pull a container URI into a Singularity image.
#
# Usage: bioc_pull2sif.sh [OPTIONS] [-h|--help] image_URI(s)
#
#
# By Lev Gorenstein, Purdue University Research Computing <lev@purdue.edu>, 2021
#
# Revision history:
# 2021-03-30 	v0.1 	Initial revision (created from ngc_pull2sif.sh v0.2.1)
# ----------------------------------------------------------------------

VERSION="0.1" 			# Increment me!
PROGNAME=${BASH_SOURCE##*/}

# ----------------------------------------------------------------------
# Configuration and initialization.
# ----------------------------------------------------------------------
OUTDIR_DEF="."

# Safe $PATH and sane behavior in pipes
export PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin
set -o pipefail

# ----------------------------------------------------------------------
# Auxillary functions.
# ----------------------------------------------------------------------
# Exit codes:
E_OK=0 					# Successful termination
E_CMDLINE=1 				# Bad command line
E_RUNTIME=2 				# Runtime error

warn() {
	# warn [-p] "message" ["message"...]
	# Send message(s) to stderr (yes, I don't like '>&2' in the main code).
	# With '-p' option, prefixes each message with "PROGNAME: " (and that's
	# pretty much the main raison-d'etre for this function vs. plain "echo").
	local msg
	local withname=0
	local opt OPTIND
	while getopts :p opt; do
		case $opt in
			p) withname=1;;
		esac
	done
	shift `expr $OPTIND - 1`

	# And now say it.
	for msg in "$@" ; do
		if [[ $withname -ne 0 ]]; then
			msg="$PROGNAME: $msg"
		fi
		echo -e "$msg" 1>&2
	done
}

verbose() {
	# verbose [-p] "message" ["message"...]
	# Logs the message to stderr if verbosity is right
	# (because I got tired of this three-lined if in the code)
	if [[ $verbo -gt 0 ]]; then
		warn "$@"
	fi
}

clean_up() {
	# Perform pre-exit housekeeping
	return
}

error_exit() {
	# error_exit ["message" [status]]
	# Special case: an explicitly empty message ('') will not be printed.
	if [[ ! ($# -gt 0 && -z "$1") ]]; then
		warn -p "${1:-"Unknown Error"}"
	fi
	clean_up
	exit ${2:-$E_RUNTIME}
}

graceful_exit() {
	# graceful_exit [status]]
	clean_up
	exit ${1:-$E_OK}
}

signal_exit() {
	# Handle trapped signals
	case $1 in
		INT)
			error_exit "Program interrupted by user" ;;
		TERM)
			error_exit "Program terminated" ;;
		*)
			error_exit "Terminating on unknown signal" ;;
	esac
}

assert_command_is_available() {
	# Bail out if command is not present
	local cmd="$1"
	type "$cmd" >/dev/null 2>&1 || error_exit "Required command '$cmd' is not available, bailing out."
}

usage() {
	local LEADIN="  $PROGNAME"
	local spacer=$(printf "%${#LEADIN}s" '')
	echo "Usage:"
	echo -e "$LEADIN [-h|--help] [OPTIONS] image_URI(s)"
}

help_message() {
	# Yes, I don't like the '<<-' form, so indentation is somewhat off
	cat << _EOF_
$PROGNAME ver. $VERSION

Pull a container URI into a Singularity image with a predefined name.

$(usage)

Options:
  -d, --dir DIR	 Output into DIR (rather than current working directory).
  -f, --force	 Force overwriting of existing images (default is skip).
 --disable-cache Do not use existing Singularity cache.
  -n, --dry-run	 Print what would be done, but don't actually do it.
  -q, --quiet	 Be really quiet (suppress most of non-essential output).
  -v, --verbose	 Be verbose (more details).
  -h, --help	 Display this help message and exit.

Resulting image name follows specific naming conventions that are used in
our Biocontainers modulefiles - which, in turn, follow conventions from
Scott McMillan's NGC Container Environment Modules repository
(https://github.com/NVIDIA/ngc-container-environment-modules). E.g.:
     URI:  docker://quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
becomes
     FILE: quay.io_biocontainers_vcftools:0.1.16--h9a82719_5.sif
(ready to be placed into an \$BIOC_IMAGE_DIR for local use by modulefiles).

Exit status:
   $E_OK  - normal termination
   $E_CMDLINE  - error parsing command line
   $E_RUNTIME  - runtime error
_EOF_
	echo ""
	return
}


uri2imgname() {
	# uri2imgname "URI"
	# Takes an image URI ($1) and converts into desired Singularity
	# image name according to our conventions (which is really a
	# Scott McMillan's convention in his NGC Containers Modules collection
	# (https://github.com/NVIDIA/ngc-container-environment-modules/).
	# E.g.:
	#   URI:  [docker://]quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
	#   IMG:  quay.io_biocontainers_vcftools:0.1.16--h9a82719_5.sif
	#
	# Note: VERY PRIMITIVE! Fancy URIs (e.g. usernames/passwords) may fail.

	local uri="$1" file=""
	file="${uri#*://}" 		# Drop {docker,https}:// prefix, if any
	file="${file//\//_}.sif" 	# And replace '/' with '_'
	echo "$file"
}


# ----------------------------------------------------------------------
# Trap signals
# ----------------------------------------------------------------------
trap "signal_exit TERM" TERM HUP
trap "signal_exit INT"  INT




# ----------------------------------------------------------------------
# Parse command-line
# ----------------------------------------------------------------------
status=$E_OK 				# Hopefully ;-)
verbo=0 				# Default verbosity
force=0 				# Overwrite image if it exists?
nocache=0 				# Disable singularity cache?
dryrun=0 				# Actually do things
declare -a ARGV SING_OPTS
while [[ -n "$1" ]]; do
	case $1 in
		-d | --dir | --directory)
			shift; OUTDIR="$1" ;;
		-f | --force)
			force=1 ;;
		--disable-cache)
			nocache=1 ;;
		-n | --dry | --dry-run)
			dryrun=1 ;;
		-q | --quiet)
			verbo=-1 ;;
		-v | --verb | --verbo | --verbose)
			verbo=1 ;;
		-h | --help)
			help_message; graceful_exit ;;
		--)
			shift; ARGV+=("$@"); break ;;
		-* | --*)
			warn -p "Unknown option '$1'"
			usage; error_exit '' $E_CMDLINE ;;
		*)
			# warn -p "Argument '$1' to process..."
			ARGV+=("$1") ;; 	# Accumulate arguments
	esac
	shift
done
set -- "${ARGV[@]}" 		# restore positional parameters
ARGC=${#ARGV[@]}


# ----------------------------------------------------------------------
# Defaults and sanity checks
# ----------------------------------------------------------------------
# Are we given any fish to fry?
if [[ ${#ARGV[@]} -eq 0 ]]; then
	verbose -p "Nothing to work on!  Run with '-h' for help."
	error_exit '' $E_OK
fi

# More defaults
OUTDIR="${OUTDIR:-$OUTDIR_DEF}"

# Required prerequisite commands, if any.
PREREQCMDS=( singularity )
for cmd in "${PREREQCMDS[@]}"; do
	assert_command_is_available "$cmd"
done


# Ensure the output directory exists
if [[ -n "$OUTDIR" && ! -d "$OUTDIR" ]]; then
	verbose -p "Output directory '$OUTDIR' does not exist, creating."
	mkdir -p "$OUTDIR" || error_exit "Output directory '$OUTDIR' not available, bailing out."
fi

# Do we force image creation if it already exists?
if [[ $force -ne 0 ]]; then
	SING_OPTS+=( "--force" )
fi

# For mass-producing images, Singularity cache (in ~/.singularity by default)
# can grow too large and take the user over quota).  Put this script's cache
# in $CLUSTER_SCRATCH if it exists.
# Note: may need 'sudo -E' for image builds (to pass environment to root).
# Note: 'singularity cache list' and 'singularity cache clean [--all]' are good.
if [[ -d "$CLUSTER_SCRATCH" ]]; then
	export SINGULARITY_CACHEDIR="$CLUSTER_SCRATCH/singularity"
	verbose -p "Setting singularity cache location: $SINGULARITY_CACHEDIR"
fi

# Do we ignore exiting cache when building an image?
if [[ $nocache -ne 0 ]]; then
	SING_OPTS+=( "--disable-cache" )
fi

# Prep for dry run if requested
DRYCMD=
if [[ $dryrun -ne 0 ]]; then
	DRYCMD=echo
fi


# ----------------------------------------------------------------------
# Main logic
# ----------------------------------------------------------------------
rc=0
declare -a FAILED_URIS SKIPPED_URIS
for URI in "${ARGV[@]}"; do
	# Convert URI to image name
	echo
	verbose -p "Processing $URI"
	OUTFILE="$OUTDIR/$(uri2imgname "$URI")"

	# If image file already exists, skip it (unless --force in effect).
	# Need to do this explicitly because otherwise singularity would
	# throw an error.
	if [[ -f "$OUTFILE" && $force -eq 0 ]]; then
		warn -p "SKIPPED: $URI --> $OUTFILE (file exists)"
		SKIPPED_URIS+=("$URI")
		continue
	fi

	# Output image file may be in a subdirectory under $OUTDIR
	# (e.g. ".../hpc/xxx.sif"), so make sure the subdirectory exists.
	# This is not currently in the NGC modules naming convention,
	# but better be safe and universal.
	# No special error handling (if this fails, the pull would catch it)
	if [[ $dryrun -eq 0 ]]; then
		mkdir -p "$(dirname "$OUTFILE")" > /dev/null
	fi

	# And pull
	verbose "# singularity pull ${SING_OPTS[*]} $(printf '%q' "$OUTFILE") $(printf '%q' "$URI")"
	$DRYCMD singularity pull "${SING_OPTS[@]}" "$OUTFILE" "$URI"
	if [[ $? -eq 0 ]]; then
		verbose -p "SUCCESS: $URI --> $OUTFILE"
	else
		verbose -p "FAILED: $URI --> $OUTFILE"
		FAILED_URIS+=("$URI")
		((rc++))
	fi
done


# ----------------------------------------------------------------------
# All done - exit.
# ----------------------------------------------------------------------
if [[ ${#SKIPPED_URIS[@]} -ne 0 ]]; then
	warn ""
	warn -p "Skipped URIs:"
	warn "$(printf '\t%s\n' "${SKIPPED_URIS[@]}")"
fi
if [[ ${#FAILED_URIS[@]} -ne 0 ]]; then
	warn ""
	warn -p "Failed URIs:"
	warn "$(printf '\t%s\n' "${FAILED_URIS[@]}")"
fi
[[ $rc -gt 0 ]] && status=$E_RUNTIME
graceful_exit $status

