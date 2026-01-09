#! /bin/bash

# This script updates the versions section of all the files in the source folder
# Example Usage: ./appendversions.sh
# Warning: Will not work unless name is exact match with both biocontainer and .rst documentation file 
# Verify biocontainer input and documentation output paths before running

current_dir="$PWD" # save current directory 
cd ../../ # go up two directories
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory

sourcefolder="$repo_path/docs/source/"
containernamesarray=`ls $sourcefolder`
inventory_json="$repo_path/scripts/documentation/rcac_biocontainers_inventory.json"

for containername in $containernamesarray
do
    # inputfolder="$repo_path/module_files/$containername/"
    # echo "input folder: "$inputfolder

    # outputfile="$sourcefolder$containername/$containername.rst"
    # echo "~~~~~~~~" > tempfile.rst
    # filenamesarray=`ls $inputfolder*.lua`

    # for eachfile in $filenamesarray
    # do
    #     echo -n "- " >> tempfile.rst
    #     eachfile=${eachfile::-4}
    #     echo "$eachfile" | sed 's:.*/::' >> tempfile.rst
    # done
    # echo "" >> tempfile.rst

    # lead='^Versions$'
    # tail='^Commands$'
    # output=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r tempfile.rst
    #     }; /$tail/p; d }"  $outputfile)
    # echo "$output" > $outputfile
    outputfile="$sourcefolder$containername/$containername.rst"
    jq -e --arg app "$containername" '.[$app]' "$inventory_json" > /dev/null || continue
    echo "Updating versions for $containername"
    # Build Versions table
    {
        echo ".. list-table::"
        echo "  :width: 100 %"
        echo "  :widths: 25 75"
        echo "  :header-rows: 1"
        echo
        echo "  * - Cluster"
        echo "    - Versions"
        echo

        jq -r --arg app "$containername" \
        '.[$app].availability
        | to_entries
        | sort_by(.key)[]
        | "  * - \(.key | ascii_upcase)\n    - \(.value | join(", "))"' \
        "$inventory_json"

        echo
    } > tempfile.rst


    lead='^Versions$'
    tail='^Commands$'

    output=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r tempfile.rst
        }; /$tail/p; d }" "$outputfile")

    echo "$output" > "$outputfile"
done
rm tempfile.rst
