#! /bin/bash

# This script generates documentation files based on the names of the missing biocontainers in listofmissingfiles.txt and then updates index.rst based on files in the 'source' folder
# listofmissingfiles.txt can be generated using generatelistofmissingfiles.sh
# Example Usage: ./generatedocumentation.sh
# Warning: Will not work if listofmissingfiles.txt does not exist
# Verify biocontainer input and documentation output paths before running

# Generate documentation for missing files using listofmissingfiles.txt
readarray -t listofmissingfiles < listofmissingfiles.txt

for filename in ${listofmissingfiles[@]}; do
   echo $filename

   inputfolder="/opt/spack/modulefiles/biocontainers/$filename/"
   echo "input folder: "$inputfolder

   filenamesarray=`ls $inputfolder*.lua`
   for eachfile in $filenamesarray
   do
      inputpath=$eachfile #This assumes last file name in alphabetical order is the file to parse
   done
   echo "input path: "$inputpath

   containername=$(echo $inputpath | awk -F/ '{print $6}')

   # outputfile="$containername.rst"
   #outputfile="/home/$USER/biocontainer_doc/source/$containername/$containername.rst"
   outputfile="/home/zhan4429/svn/Purdue-RCAC-Biocontainer/source/$containername/$containername.rst"
   echo "output file: "$outputfile

   inputpathcontent=$(<$inputpath)  

   mkdir -p /home/$USER/svn/Purdue-RCAC-Biocontainer/source/$containername

   echo ".. _backbone-label:" > $outputfile
   echo "" >> $outputfile
   echo "${containername^}" >> $outputfile
   echo "==============================" >> $outputfile
   echo "" >> $outputfile
   echo "Introduction" >> $outputfile
   echo "~~~~~~~~" >> $outputfile
   description=$(echo $inputpathcontent | sed -e 's/Description/\nDescription\n/' -e 's/More information/\nMore information\n/' | sed -n '/Description/,/More information/{//!p}')
   description=$(echo $description | sed 's/=//g')
   echo $description >> $outputfile
   echo "For more information, please check:" >> $outputfile
   moreinformation=$(echo $inputpathcontent | sed -e 's/More information/\nMore information\n/' -e 's/]==])/\n]==])\n/' | sed -n '/More information/,/]==])/{//!p}')
   moreinformation=$(echo $moreinformation | sed 's/=//g')
   moreinformation=$(echo $moreinformation | sed 's/-//')
   echo $moreinformation | sed 's/- /\n/g' >> $outputfile
   echo "" >> $outputfile
   echo "Versions" >> $outputfile
   echo "~~~~~~~~" >> $outputfile
   for eachfile in $filenamesarray
   do
      echo -n "- " >> $outputfile
      eachfile=${eachfile::-4}
      echo "$eachfile" | sed 's:.*/::' >> $outputfile
   done
   echo "" >> $outputfile
   echo "Commands" >> $outputfile
   echo "~~~~~~~" >> $outputfile
   localprograms=$(echo "$inputpathcontent" | sed -n '/local programs/,/local/p')
   localprograms=$(echo $localprograms | grep -oP '\{\K[^\}]+')
   IFS=', ' read -r -a array <<< "$localprograms"
   for element in "${array[@]}"
   do
      echo -n "- " >> $outputfile
      echo "$element" | cut -d'"' -f 2 >> $outputfile
   done
   echo "" >> $outputfile
   echo "Module" >> $outputfile
   echo "~~~~~~~~" >> $outputfile
   echo "You can load the modules by::" >> $outputfile
   echo "" >> $outputfile
   echo "    module load biocontainers" >> $outputfile
   echo "    module load $containername" >> $outputfile
   echo "" >> $outputfile
   echo "Example job" >> $outputfile
   echo "~~~~~" >> $outputfile
   echo ".. warning::" >> $outputfile
   echo "    Using \`\`#!/bin/sh -l\`\` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use \`\`#!/bin/bash\`\` instead." >> $outputfile
   echo "" >> $outputfile
   echo "To run $containername on our clusters::" >> $outputfile
   echo "" >> $outputfile
   echo -e "    #!/bin/bash\n    #SBATCH -A myallocation     # Allocation name\n    #SBATCH -t 1:00:00\n    #SBATCH -N 1\n    #SBATCH -n 1\n    #SBATCH --job-name=$containername\n    #SBATCH --mail-type=FAIL,BEGIN,END\n    #SBATCH --error=%x-%J-%u.err\n    #SBATCH --output=%x-%J-%u.out" >> $outputfile
   echo "" >> $outputfile
   echo "    module --force purge" >> $outputfile
   echo "    ml biocontainers $containername" >> $outputfile
   echo "" >> $outputfile
done

# Update index.rst using names of files in source folder

sourcefolder="/home/$USER/svn/Purdue-RCAC-Biocontainer/source/"
indexfile="/home/$USER/svn/Purdue-RCAC-Biocontainer/index.rst"

filenamesarray=`ls $sourcefolder`

sed -i '/Application list/,$d' $indexfile
echo "   :caption: Application list" >> $indexfile
echo "   :maxdepth: 3" >> $indexfile
echo "   :titlesonly:" >> $indexfile
echo "   " >> $indexfile
for eachfile in $filenamesarray
do
   echo "   source/$eachfile/$eachfile" >> $indexfile
done
