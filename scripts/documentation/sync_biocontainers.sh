#!/bin/bash
# Sync the modulefiles from "Cluster-Modulefiles" to rcac-docs software folder.

BIODOCS_MODULE_PATH="/depot/itap/jin456/rcac_github/Biocontainers/modulefiles"
ANVIL_MODULE_REPO="/depot/itap/jin456/rcac_github/Anvil-Modulefiles"
BELL_MODULE_REPO="/depot/itap/jin456/rcac_github/Bell-Modulefiles"
NEGISHI_MODULE_REPO="/depot/itap/jin456/rcac_github/Negishi-Modulefiles"
GAUTSCHI_MODULE_REPO="/depot/itap/jin456/rcac_github/Gautschi-Modulefiles"
GILBRETH_MODULE_REPO="/depot/itap/jin456/rcac_github/Gilbreth-Modulefiles"
SCHOLAR_MODULE_REPO="/depot/itap/jin456/rcac_github/Scholar-Modulefiles/opt/spack/modulefiles"

# Sync Anvil
cd $ANVIL_MODULE_REPO
echo "Updating Anvil biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $ANVIL_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/anvil/

# Sync Bell
cd $BELL_MODULE_REPO
echo "Updating Bell biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $BELL_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/bell/

# Sync Negishi
cd $NEGISHI_MODULE_REPO
echo "Updating Negishi biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $NEGISHI_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/negishi/

# Sync Gautschi
cd $GAUTSCHI_MODULE_REPO
echo "Updating Gautschi biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $GAUTSCHI_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/gautschi/

# Sync Gilbreth
cd $GILBRETH_MODULE_REPO
echo "Updating Gilbreth biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $GILBRETH_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/gilbreth/

# Sync Scholar
cd $SCHOLAR_MODULE_REPO
echo "Updating Scholar biocontainers..."
echo `pwd`
git pull
rsync -rtvpl --delete $SCHOLAR_MODULE_REPO/biocontainers/* $BIODOCS_MODULE_PATH/scholar/

# # Update modulefiles for rcac docs
# cd $BIODOCS_MODULE_PATH
# # Remove all broken links as they will cause issues with mkdocs build
# find . -type l -exec test ! -e {} \; -print -delete 2>/dev/null
# git checkout main
# git pull
# git status
# git add $BIODOCS_MODULE_PATH
# git commit -m "Update modules."
# git push -u origin main

