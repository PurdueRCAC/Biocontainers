# Makefile runs generatelistofmissingfiles, generatedocumentation, and appendversions in that order

run:
	./update_apps_inventory.sh -v
	./generatelistofmissingfiles.sh
	./generatedocumentation.sh
	./appendversions.sh
