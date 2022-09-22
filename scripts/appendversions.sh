#! /bin/bash

# This script updates the versions section of all the files in the source folder
# Example Usage: ./appendversions.sh
# Warning: Will not work unless name is exact match with both biocontainer and .rst documentation file 
# Verify biocontainer input and documentation output paths before running

# sourcefolder="/home/$USER/svn/Purdue-RCAC-Biocontainer/source/"
sourcefolder="/home/$USER/svn/Purdue-RCAC-Biocontainer/source/"
containernamesarray=`ls $sourcefolder`

for containername in $containernamesarray
do
    inputfolder="/opt/spack/modulefiles/biocontainers/$containername/"
    echo "input folder: "$inputfolder

    # outputfile="/home/$USER/svn/Purdue-RCAC-Biocontainer/source/$containername/$containername.rst"
    outputfile="/home/$USER/svn/Purdue-RCAC-Biocontainer/source/$containername/$containername.rst"

    echo "~~~~~~~~" > tempfile.rst
    filenamesarray=`ls $inputfolder*.lua`

    for eachfile in $filenamesarray
    do
        echo -n "- " >> tempfile.rst
        eachfile=${eachfile::-4}
        echo "$eachfile" | sed 's:.*/::' >> tempfile.rst
    done
    echo "" >> tempfile.rst

    lead='^Versions$'
    tail='^Commands$'
    output=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r tempfile.rst
        }; /$tail/p; d }"  $outputfile)
    echo "$output" > $outputfile
    
done
rm tempfile.rst
