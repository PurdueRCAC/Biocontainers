#! /bin/bash
# This script generates the source_ur.md file based on the local uri in the lua files of the biocontainers
# Example Usage: ./generatesource_uri.sh
# Verify biocontainers path and output file path before running

biocontainerspath="/opt/spack/modulefiles/biocontainers/"

listofbiocontainerfiles=`ls $biocontainerspath`

outputfile="/home/$USER/svn/Purdue-RCAC-Biocontainer/source_uri.md"

echo "# Source Uri" > $outputfile
echo "" >> $outputfile
for filename in $listofbiocontainerfiles; do
   echo $filename
   echo "## ${filename^}" >> $outputfile
#    echo "==============================" >> $outputfile
   echo "" >> $outputfile

   inputfolder="$biocontainerspath$filename/"

   cd $inputfolder
   filenamesarray=`ls`
   for eachfile in $filenamesarray
   do

    inputpath="$inputfolder$eachfile"

    containername=$(echo $inputpath | awk -F/ '{print $6}')

    echo "**Version:** ${eachfile::-4}" >> $outputfile
    echo "" >> $outputfile

    localuri=$(sed -n '/^local uri/p' $inputpath)
    localuri=`echo "$localuri" | cut -d'"' -f 2`
    echo "**Local Uri:** $localuri" >> $outputfile

    echo "" >> $outputfile

   done
   echo "<br>" >> $outputfile
   echo "" >> $outputfile

done
