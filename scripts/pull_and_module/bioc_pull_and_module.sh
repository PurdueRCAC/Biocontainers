#!/bin/bash
#
# A very simple script to pull containers and generate their modulefiles
# (i.e. just a wrapper for the two main workhorse scripts).
#
# Usage: bioc_pull_and_module.sh URI(s)
#
# E.g.:
#          bioc_pull_and_module.sh docker://quay.io/biocontainers/aaa:X.Y
# to produce 'quay.io_biocontainers_aaa:X.Y.sif' and "aaa/X.Y.lua" in one move.
#
# For convenience, auto-creates a log file.
# ----------------------------------------------------------------------

# Where to?
IMG_OUTDIR="images"
MOD_OUTDIR="incomplete"
MOD_EXISTING_DIR="modulefiles"

# ----------------------------------------------------------------------
# Required helper scripts... either in PATH or look for them next to ourselves.
# ----------------------------------------------------------------------
PROGDIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"
URI2SIF=bioc_pull2sif.sh
type "$URI2SIF" >& /dev/null || URI2SIF="$PROGDIR/$URI2SIF"
if [[ "$URI2SIF" == /* && ! -x "$URI2SIF" ]]; then
        echo "Can not execute $URI2SIF, does it exist? Bailing out."
        exit 1
fi
URI2MOD=bioc_pull2mod.sh
type "$URI2MOD" >& /dev/null || URI2MOD="$PROGDIR/$URI2MOD"
if [[ "$URI2MOD" == /* && ! -x "$URI2MOD" ]]; then
        echo "Can not execute $URI2MOD, does it exist? Bailing out."
        exit 1
fi

# And go!
LOGFILE="$(date -I).${BASH_SOURCE[0]##*/}.log"
URI2SIF_OPTS=( --verbose --dir "$IMG_OUTDIR" )
URI2MOD_OPTS=( --verbose --dir "$MOD_OUTDIR" -m "$MOD_EXISTING_DIR" --force )
printf "# *** %s\n" "" "Generating images in $IMG_OUTDIR, modules in $MOD_OUTDIR" "" |& tee "$LOGFILE"

for URI in "$@"; do
	echo "# $URI2MOD ${URI2MOD_OPTS[@]} $URI" |& tee -a "$LOGFILE"
	"$URI2MOD" "${URI2MOD_OPTS[@]}" "$URI"    |& tee -a "$LOGFILE"
	echo |& tee -a "$LOGFILE"

	echo "# $URI2SIF ${URI2SIF_OPTS[@]} $URI" |& tee -a "$LOGFILE"
	"$URI2SIF" "${URI2SIF_OPTS[@]}" "$URI"    |& tee -a "$LOGFILE"
done
