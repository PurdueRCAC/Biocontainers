#!/bin/bash
# ----------------------------------------------------------------------
# bioc_pull2mod.sh - Generate a modulefile stub from a container URI.
#
# Usage: bioc_pull2mod.sh [OPTIONS] [-h|--help] image_URI(s)
#
#
# By Lev Gorenstein, Purdue University Research Computing <lev@purdue.edu>, 2021
#
# Revision history:
# 2021-04-01 	v0.1 	Initial revision (created by new_script ver. 3.2-LG19).
# 2021-04-03 	v0.2 	Special handling on certain apps like Qiime2 that
# 			have their own dedicated quay.io collections (as
# 			opposed to most that are just in 'biocontainers').
# 2021-04-04 	v0.3 	Ability to use existing modulefiles as stubs
# 			(handy for new versions of existing applications).
# 2022-09-28 	v0.3.1 	Minor tweaks and special application names.
# ----------------------------------------------------------------------

VERSION="0.3.1" 			# Increment me!
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

Generate a modulefile stub from a container URI.

$(usage)

Options:
  -d, --dir DIR	 Output into DIR (defaults to current working directory).
  -m, --moduledir DIR
		 If an existing modulefile(s) for a given application exist
		 under DIR, use the latest one of them as a template for the
		 newly-generated modulefile (rather than producing default
		 stub).  In other words, just replace version/url/image name
		 in the existing modulefile and save it as new - very handy
		 when pulling new versions of existing applications.
	 	 Multiple '-m' options will can be given and will be combined.
		 The '-d' output directory is always searched.
  -f, --force	 Force overwriting of existing modulefiles (default is skip).
  -n, --dry-run	 Print what would be done, but don't actually do it.
  -q, --quiet	 Be really quiet (suppress most of non-essential output).
  -v, --verbose	 Be verbose (more details).
  -h, --help	 Display this help message and exit.

Application name and version are taken from the URI. Biocontainers often
have a "--<hash>_<release>" appended to the application version - we strip
them from the module name.  E.g.:
     URI:  docker://quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
becomes
     FILE: vcftools/0.1.16.lua
(ready to be placed into a biocontainers modules collection).

Note: this is just a stub!  It still needs manual editing (description, etc).
The '-m' option (use existing modulefiles for given application as templates
for new ones) is quite handy when pulling new versions of deployed programs.
Note though that this part of the code is quite flaky and very much depends
on these existing modules following our coding convention (layout, variable
names, etc).  Inspect and adjust!

Typical suggested workflow:
  1. Generate the stubs for desired modulefiles:
       $PROGNAME -f -v -d incomplete -m /opt/spack/modulefiles/biocontainers URIs
     (output into 'incomplete', use existing modules as templates if present).
  2. Edit generated stubs to fill in blanks ('vim incomplete/*/*.lua').
  3. Test modulefiles:
       module use incomplete
       export BIOC_IMAGE_DIR=/apps/biocontainers/images
       module load ....
  4. When satisfied, deploy modulefiles to production.

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
	file="${uri#*://}"              # Drop {docker,https}:// prefix, if any
	file="${file//\//_}.sif"        # And replace '/' with '_'
	echo "$file"
}


uri2modname() {
	# uri2modname "URI"
	# Takes an image URI ($1) and converts into desired modulefile
	# name according to our naming conventions.
	#
	# Note: biocontainers often have additional interpreter, unique hash
	# and/or container release information appended, in the form of a
	#	--<pyXY|plXYZ>h<hash>_<release>
	# string (where XYZ version numbers may or may not be present).
	# We strip hash and release number, but keep the interpreter
	# information in the module name just in case.
	# E.g.:
	#   URI:  [docker://]quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
	#   MOD:  vcftools/0.1.16.lua
	# and
	#   URI:  [docker://]quay.io/biocontainers/bowtie2:2.4.2--py36hff7a194_2
	#   MOD:  bowtie2/2.4.2-py36
	#
	# Note: VERY PRIMITIVE! Fancy URIs (e.g. usernames/passwords) may fail.

	local uri="$1" file
	local app=$(uri2app "$uri") 	# Application name
	local buf="${uri##*/}" 		# Drop all until just name:version
	local modver=${buf##*:} 	# Version starts after last ':'

	# Handle interpreter/hash/release string.
	# First, if there is an '--interpreter' (or '--extralibNNinterpreterMM')
	# part, make it single dash and move the '--' after it:
	#       deeptools:3.5.1--py_0         -> deeptools:3.5.1-py--_0 
	# 	bowtie2:2.4.2--py36hff7a194_2 -> bowtie2:2.4.2-py36--hff7a194_2
	#       biopython:1.70--np112py36_1   -> biopython:1.70-np112py36--_1
	# And then trim hash and release (everything past '--' or '_$')
	modver=$(echo "$modver" | sed -re 's/--((np[0-9.]*)*(py|pl)[0-9.]*)/-\1--/') # keep interpreter
	modver=$(echo "$modver" | sed -re 's/(--.*)?(_[0-9]+)?$//') # trim --hash_release

	file="$app/$modver.lua"
	echo "$file"
}


uri2app() {
	# uri2app "URI"
	# Takes an image URI ($1) and extracts the application name according
	# to our conventions.  Handles some applications specially
	# E.g.:
	#   URI:  [docker://]quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
	#   APP:  vcftools
	# Special:
	#   URI:  [docker://]quay.io/qiime2/core:2021.2
	#   APP:  qiime2
	#   URI:  [docker://]r-base:4.1.1
	#   APP:  r
	#   URI:  [docker://]nvcr.io/nvidia/clara/clara-parabricks:4.0.0-1
	#   APP:  parabricks
	# etc.

	local uri="$1" app

	# Some special apps have their own dedicated repositories (as opposed
	# to a central 'biocontainers' one), handle them first.
	if [[ "$uri" == */qiime2/core:* ]]; then
		app="qiime2"
	elif [[ "$uri" == */r-base:* ]]; then
		app="r"
	elif [[ "$uri" == */cumulusprod_cellranger:* ]]; then
		app="cellranger"
	elif [[ "$uri" == */nvidia/clara/clara-parabricks:* ]]; then
		app="parabricks"
	else
		# And all "normal" apps will fall here
		app="${uri##*/}" 	# Drop all until just name:version
		app=${app%%:*} 		# And drop ":version"
	fi
	echo "$app"
}


uri2ver() {
	# uri2ver "URI"
	# Takes an image URI ($1) and extracts the application version
	# according to our conventions.  Biocontainers often have
	# a "--<interpreter>h<hash>_<release>" appended to the application
	# version - these are not part of application version (and get removed).
	# E.g.:
	#   URI:  [docker://]quay.io/biocontainers/vcftools:0.1.16--h9a82719_5
	#   VER:  0.1.16

	local uri="$1" ver
	ver="${uri##*/}" 		# Drop all until just name:version
	ver=${ver##*:} 			# And drop "name:"

	# Trim all "--<interpreter>h<hash>_<release>" extras.
	ver=$(echo "$ver" | sed -re 's/(--.*)?(_[0-9]+)?$//')
	echo "$ver"
}


print_modulefile() {
	# print_modulefile "URI"
	# This function takes an image URI ($1), determines whether any
	# earlier modulefiles for this app exist, and calls the proper
	# modulefile generator (brand new or using existing as template).

	local uri="$1"
	local app=$(uri2app "$uri") 		# vcftools
	local latest_modulefile=$(find_latest_modulefile "$app") # file or empty

	# New or existing?
	if [[ -z "$latest_modulefile" ]]; then
		generate_new_modulefile "$uri"
	else
		repurpose_old_modulefile "$uri" "$latest_modulefile"
	fi
	return $? 		# Generators return $MODTYPE_***, pass it on
}


find_latest_modulefile() {
	# find_latest_modulefile "APP"
	# Determines whether we already have any modulefiles for the APP ($1).
	# Returns a path to a suitable modulefile, or empty string if none
	# found.
	# Running 'find' in modules directory may be painful (hard to sort
	# resulting versions), so use Lmod to do it for us.

	local app="$1"

	# Are there any modules for this app?
	# Be careful about fuzzy matches, and pick first exact one.
	local module=$(module -q -t --redirect --ignore_cache avail "$app" 2> /dev/null | grep "^$app/" | head -1)
	[[ -z "$module" ]] && return

	# Looks like there is an existing module to use... get its filename
	# from the header of a 'module show' (second line).
	local modulefile=$(module -q -t --redirect --raw show "$module" 2> /dev/null | awk 'NR==2 {print $1}')
	if [[ $? -ne 0 ]]; then
		warn -p "Error while trying to locate existing modulefule '$module' for template."
	fi
	modulefile=${modulefile%%:} 		# And trim terminal ':'
	echo "$modulefile"
}


generate_new_modulefile() {
	# generate_new_modulefile "URI"
	# The main workhorse - takes an image URI ($1) and generates a brand
	# new stub of a modulefile prints the it.  Leaving a handful of
	# TODOs for a human to edit afterwards.
	#
	# Note: this work is based on Nvidia environment containers modules
	# (https://github.com/NVIDIA/ngc-container-environment-modules/), and
	# original modulefiles were MIT-licensed, so retaining the license
	# info and stating Purdue contribution as well.
	#
	# NB: if you change whatis or version/image/uri lines, remember to
	# check the awk command in the repurpose_old_modulefile function.

	local uri="$1"
	local image=$(uri2imgname "$uri") 	# docker://aaaa/vcftools:0.1.16--blah
	local app=$(uri2app "$uri") 		# vcftools
	local ver=$(uri2ver "$uri") 		# 0.1.16

	local bioc_url="https://biocontainers.pro/tools/$app"
	local home_url="########################"

	# I don't like <<-, so indentation is a bit messed up
	verbose -p "No existing modulefiles for '$app' found, generating fresh stub."
	cat <<___EOF___
-- The MIT License (MIT)
--
-- Copyright (c) 2021 Purdue University
-- Copyright (c) 2020 NVIDIA Corporation
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.

-- TODO: edit name, description, home page URL (in help and whatis)
help([==[

Description
===========
${app^} is ###############################################################

More information
================
 - BioContainers: $bioc_url
 - Home page:     $home_url
]==])

whatis("Name: ${app^}")
whatis("Version: $ver")
whatis("Description: ${app^} is ###############################################################")
whatis("BioContainers: $bioc_url")
whatis("Home page:     $home_url")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

-- TODO: check module conflicts (think older version, OpenMPI, etc)
conflict(myModuleName())

-- TODO: Add all necessary commands to the programs={} list!
--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "$image"
local uri = "$uri"
local programs = {"$app"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
-- Trim off the training newline.
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)

   if not (isFile(image)) then
      -- The image could not be found in the container directory
      if (mode() == "load") then
         LmodMessage("file not found: " .. image)
         LmodMessage("The container image will be pulled upon first use to the Singularity cache")
      end
      image = uri

      -- Alternatively, this could pull the container image and
      -- save it in the container directory
      --if (mode() == "load") then
      --   subprocess(singularity .. " pull " .. image .. " " .. uri)
      --end
   end
else
   -- Look for the image in the Singularity cache, and if not found
   -- download it when "singularity run" is invoked.
   image = uri
end

-- Determine Nvidia and/or AMD GPUs (to pass coresponding flag to Singularity)
local run_args = {}
if (capture("nvidia-smi -L 2>/dev/null") ~= "") then
   if (mode() == "load") then
      LmodMessage("BIOC: Enabling Nvidia GPU support in the container.")
   end
   table.insert(run_args, "--nv")
end
if (capture("/opt/rocm/bin/rocm-smi -i 2>/dev/null | grep ^GPU") ~= "") then
   if (mode() == "load") then
      LmodMessage("BIOC: Enabling AMD GPU support in the container.")
   end
   table.insert(run_args, "--rocm")
end

-- And assemble container command
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- TODO: Uncomment or delete these lines (only needed for MPI-enabled programs)
-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"\$@\"",
                                container_launch .. " " .. program .. " \$*")
end

-- Additional commands or environment variables, if any

___EOF___

	return $MODTYPE_NEW 			# report back the type
}


repurpose_old_modulefile() {
	# repurpose_old_modulefile "URI" "template_modulefile"
	# The other main workhorse - takes an image URI ($1) and an existing
	# template modulefile ($2), and generates a new modulefile by
	# replacing just version/image/container URI.  Very handy for new
	# versions of existing applications.
	# Note that this is intriniscally fragile and depends on the template
	# following our code conventions.

	local uri="$1" template="$2"
	local image=$(uri2imgname "$uri") 	# docker://aaaa/vcftools:0.1.16--blah
	local app=$(uri2app "$uri") 		# vcftools
	local ver=$(uri2ver "$uri") 		# 0.1.16

	# Sanity check - can we read the template?  Is the template sane?
	if [[ -z "$template" || ! -r "$template" || $(wc -l < "$template") -lt 2 ]]; then
		warn -p "Can not use existing module template '$template' for '$uri'"
		warn -p "Falling back to a fresh stub generator."
		generate_new_modulefile "uri"
		return $?
	fi
	verbose -p "Using existing modulefile '$template' as template."

	# OK, let's mangle it: version / image file / container URI.
	local buf=$(awk -v ver="$ver" -v "image=$image" -v uri="$uri" -- '
		/^[[:blank:]]*whatis.*Version:/ {
			$0 = "whatis(\"Version: " ver "\")"
		}
		/^[[:blank:]]*local[[:blank:]]+image[[:blank:]]*=/ {
			$0 = "local image = \"" image "\""
		}
		/^[[:blank:]]*local[[:blank:]]+uri[[:blank:]]*=/ {
			$0 = "local uri = \"" uri "\""
		}
		{print}
		' < "$template"
	)

	# Another sanity check - did mangling succeed?
	if [[ $? -ne 0 || $(echo "$buf" | wc -l) -lt 2 ]]; then
		warn -p "Error while re-using existing module template '$template' for '$uri'"
		warn -p "Falling back to a fresh stub generator."
		generate_new_modulefile "uri"
		return $?
	fi

	echo "$buf"
	return $MODTYPE_EXISTING 		# report back the type
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
force=0 				# Overwrite modulefile if it exists?
nocache=0 				# Disable singularity cache?
dryrun=0 				# Actually do things
declare -a ARGV SING_OPTS MODULEDIRS
while [[ -n "$1" ]]; do
	case $1 in
		-d | --dir | --directory)
			shift; OUTDIR="$1" ;;
		-m | --module-dir | --module-directory | --moduledir | --moduledirectory)
			shift; MODULEDIRS+=("$1") ;;
		-f | --force)
			force=1 ;;
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

# Ensure the output directory exists
if [[ -n "$OUTDIR" && ! -d "$OUTDIR" ]]; then
	verbose -p "Output directory '$OUTDIR' does not exist, creating."
	mkdir -p "$OUTDIR" || error_exit "Output directory '$OUTDIR' not available, bailing out."
fi

# Add OUTDIR to places where we look for currently existing modules
MODULEDIRS+=( "$(readlink -m "$OUTDIR")" )

# We will use Lmod to search for existing modulefiles of each application.
# Trim $MODULEPATH to only contain locations we want.
SAVE_MODULEPATH="$MODULEPATH"
MODULEPATH=$(printf "%s\n" "${MODULEDIRS[@]}" | paste -s -d ':')

# Global constants for types of resulting modulefiles (new or from template).
MODTYPE_NEW=0
MODTYPE_EXISTING=1

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
	# Convert URI to modulefile name
	echo
	verbose -p "Processing $URI"
	OUTFILE="$OUTDIR/$(uri2modname "$URI")"

	# If modulefile already exists, skip it (unless --force in effect).
	if [[ -f "$OUTFILE" && $force -eq 0 ]]; then
		warn -p "SKIPPED: $URI --> $OUTFILE (file exists)"
		SKIPPED_URIS+=("$URI")
		continue
	fi

	# Output modulefile is in a subdirectory under $OUTDIR (e.g.
	# ".../vcftools/0.1.16.lua"), so make sure the subdirectory exists.
	# No special error handling (if this fails, creation would catch it)
	if [[ $dryrun -eq 0 ]]; then
		mkdir -p "$(dirname "$OUTFILE")" > /dev/null
	fi

	# And create the modulefile!
	# In dry-run mode dump modulefile to stdout.
	# Note: can not redirect the dump straight into new modulefile
	# (because redirection happens first, while we may still need old
	# content as a template).  So save into $MODULE, then redirect.
	verbose -p "Creating $OUTFILE"
	MODULE=$(print_modulefile "$URI")
	TYPE=$? 				# capture reported module type
	if [[ $dryrun -eq 0 ]]; then
		echo "$MODULE" > "$OUTFILE"
	else
		echo "$MODULE"
	fi
	if [[ $? -eq 0 ]]; then
		verbose -p "SUCCESS: $URI --> $OUTFILE"
		if [[ $verbo -ge 0 ]]; then
			if [[ $TYPE -eq $MODTYPE_NEW ]]; then
				echo "Remember to edit '$OUTFILE' stub (look for TODO: labels!)"
			elif [[ $TYPE -eq $MODTYPE_EXISTING ]]; then
				echo "Remember to inspect '$OUTFILE' for template deficiencies."
			fi
		fi
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

