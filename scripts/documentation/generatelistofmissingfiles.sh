#! /bin/bash

# This script generates a list of biocontainers that are not in the git directory
# The output file is listofmissingfiles.txt and is used in generatedocumentation.sh
# Example usage: ./generatedocumentation.sh

current_dir="$PWD" # save current directory 
cd ../../ # go up two directories
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory

biocontainers="$repo_path/modulefiles"
gitfolders="$repo_path/docs/source"

rm listofmissingfiles.txt
touch tempfile.txt
for cluster_path in "$biocontainers"/*; do
    diff -q "$gitfolders" "$cluster_path" | grep "Only in $biocontainers"
    diff -q "$gitfolders" "$cluster_path" | grep "Only in $biocontainers" >> tempfile.txt
done

awk 'NF{ print $NF }' tempfile.txt > listofmissingfiles.txt
sort -u listofmissingfiles.txt -o listofmissingfiles.txt
rm tempfile.txt
