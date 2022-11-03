## Scripts for automatic updating documentation

### There are three main scripts used to automatically update the documentation.

Typing 'make' in the scripts/documentation folder runs them in the following order. They can also be run individually from the same folder if required.

1. generatelistofmissingfiles.sh: This script generates a list of biocontainers that are not in the source folder.

    The output file is listofmissingfiles.txt and is used in generatedocumentation.sh

        Example usage: ./generatedocumentation.sh

2. generatedocumentation.sh: This script generates documentation files based on the names of the missing biocontainers in listofmissingfiles.txt and then updates index.rst based on the files in the source folder.

    listofmissingfiles.txt can be generated using generatelistofmissingfiles.sh
        
        Example Usage: ./generatedocumentation.sh

3. appendversion.sh: This script updates the versions section of all the files in the source folder.

        Example Usage: ./appendversions.sh 