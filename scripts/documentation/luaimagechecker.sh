#! /bin/bash

# This script checks all the lua files in the biocontainers folder to see if the local uri exists and if it does, if the local image is correctly built from it
# Example Usage: ./luaimagecheckersh
# Differences are stored in outputfiles as seen below
outputfile1="missinglocaluri.txt"
outputfile2="localimagenotequal.txt"

sourcefolder="/opt/spack/modulefiles/biocontainers/"
containernamesarray=`ls $sourcefolder`

echo "Missing Local Uri" > $outputfile1
echo "" >> $outputfile1
echo "" >> $outputfile1

echo "Local image not equal to converted uri" > $outputfile2
echo "" >> $outputfile2
echo "" >> $outputfile2

for containername in $containernamesarray
do
    inputfolder="/opt/spack/modulefiles/biocontainers/$containername/"
    tempvariable=0
    filenamesarray=`ls $inputfolder*.lua`
    for eachfile in $filenamesarray
    do
        inputpath=$eachfile

        localimage=$(grep ^'local image' $inputpath | awk '{$1=""; print $0}')
        localimage=`echo "$localimage" | cut -d'"' -f 2`

        localuri=$(grep ^'local uri' $inputpath | awk '{$1=""; print $0}')
        localuri=`echo "$localuri" | cut -d'"' -f 2`

        if [ ${#localuri} -le 1 ]; 
        then
            # Missing Uri File
            tempvariable=1
            inputpath=${inputpath:37}
            echo "File name: $inputpath" >> $outputfile1
            echo "Local image: $localimage" >> $outputfile1
            echo "" >> $outputfile1
            # echo "" >> $outputfile1
        else
            # Not missing Uri File
            tempvariable=0
            modifieduri=${localuri:9} # Removing first 9 characters (docker://)
            modifieduri+=".sif" # adding .sif to end of string
            image2=$(echo "$modifieduri" | tr '/' '_') # Replaceing all / with _

            if [ "$image2" != "$localimage" ]; then
                # local image is not equal to converted uri
                tempvariable=2
                inputpath=${inputpath:37}
                echo "File name: $inputpath" >> $outputfile2
                echo "Local image: $localimage" >> $outputfile2
                echo "Local uri: $localuri" >> $outputfile2
                echo "" >> $outputfile2
                
            fi
        fi
    done
    # Output files formatting
    # if [ "$tempvariable" = "1" ]; then
    #     echo "" >> $outputfile1
    #     echo "" >> $outputfile1
    # elif [ "$tempvariable" = "2" ]; then
    #     echo "" >> $outputfile2
    #     echo "" >> $outputfile2
    # fi
done