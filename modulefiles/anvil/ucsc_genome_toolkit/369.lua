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

help([==[

Description
===========
UCSC genome toolkit is a collection of a variety of executables that perform functions ranging from sequence analysis and format conversion, to basic number crunching and statistics, to complex database generation and manipulation.

More information
================
 - Docker hub: https://hub.docker.com/r/rahulg603/ucsc_genome_toolkit
 - Home page:     http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v369/
]==])

whatis("Name: Ucsc_genome_toolkit")
whatis("Version: 369")
whatis("Description: UCSC genome toolkit is a collection of a variety of executables that perform functions ranging from sequence analysis and format conversion, to basic number crunching and statistics, to complex database generation and manipulation.")
whatis("Docker hub: https://hub.docker.com/r/rahulg603/ucsc_genome_toolkit")
whatis("Home page:     http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64.v369/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "rahulg603_ucsc_genome_toolkit:latest.sif"
local uri = "docker://rahulg603/ucsc_genome_toolkit:latest"
local programs = {"addCols", "ameme", "autoDtd", "autoSql", "autoXml", "ave", "aveCols", "axtChain", "axtSort", "axtSwap", "axtToMaf", "axtToPsl", "bamToPsl", "barChartMaxLimit", "bedClip", "bedCommonRegions", "bedCoverage", "bedExtendRanges", "bedGeneParts", "bedGraphPack", "bedGraphToBigWig", "bedIntersect", "bedItemOverlapCount", "bedJoinTabOffset", "bedJoinTabOffset.py", "bedMergeAdjacent", "bedPartition", "bedPileUps", "bedRemoveOverlap", "bedRestrictToPositions", "bedSingleCover.pl", "bedSort", "bedToBigBed", "bedToExons", "bedToGenePred", "bedToPsl", "bedWeedOverlapping", "bigBedInfo", "bigBedNamedItems", "bigBedSummary", "bigBedToBed", "bigGenePredToGenePred", "bigHeat", "bigMafToMaf", "bigPslToPsl", "bigWigAverageOverBed", "bigWigCat", "bigWigCluster", "bigWigCorrelate", "bigWigInfo", "bigWigMerge", "bigWigSummary", "bigWigToBedGraph", "bigWigToWig", "binFromRange", "blastToPsl", "blastXmlToPsl", "blat", "calc", "catDir", "catUncomment", "chainAntiRepeat", "chainBridge", "chainCleaner", "chainFilter", "chainMergeSort", "chainNet", "chainPreNet", "chainScore", "chainSort", "chainSplit", "chainStitchId", "chainSwap", "chainToAxt", "chainToPsl", "chainToPslBasic", "checkAgpAndFa", "checkCoverageGaps", "checkHgFindSpec", "checkTableCoords", "chopFaLines", "chromGraphFromBin", "chromGraphToBin", "chromToUcsc", "clusterGenes", "clusterMatrixToBarChartBed", "colTransform", "countChars", "cpg_lh", "crTreeIndexBed", "crTreeSearchBed", "dbSnoop", "dbTrash", "endsInLf", "estOrient", "expMatrixToBarchartBed", "faAlign", "faCmp", "faCount", "faFilter", "faFilterN", "faFrag", "faNoise", "faOneRecord", "faPolyASizes", "faRandomize", "faRc", "faSize", "faSomeRecords", "faSplit", "faToFastq", "faToTab", "faToTwoBit", "faToVcf", "faTrans", "fastqStatsAndSubsample", "fastqToFa", "featureBits", "fetchChromSizes", "findMotif", "fixStepToBedGraph.pl", "gapToLift", "genePredCheck", "genePredFilter", "genePredHisto", "genePredSingleCover", "genePredToBed", "genePredToBigGenePred", "genePredToFakePsl", "genePredToGtf", "genePredToMafFrames", "genePredToProt", "gensub2", "getRna", "getRnaPred", "gff3ToGenePred", "gff3ToPsl", "gmtime", "gtfToGenePred", "headRest", "hgBbiDbLink", "hgFakeAgp", "hgFindSpec", "hgGcPercent", "hgGoldGapGl", "hgLoadBed", "hgLoadChain", "hgLoadGap", "hgLoadMaf", "hgLoadMafSummary", "hgLoadNet", "hgLoadOut", "hgLoadOutJoined", "hgLoadSqlTab", "hgLoadWiggle", "hgSpeciesRna", "hgTrackDb", "hgWiggle", "hgsql", "hgsqldump", "hgvsToVcf", "hicInfo", "htmlCheck", "hubCheck", "hubClone", "hubPublicCheck", "ixIxx", "lastz-1.04.00", "lastz_D-1.04.00", "lavToAxt", "lavToPsl", "ldHgGene", "liftOver", "liftOverMerge", "liftUp", "linesToRa", "localtime", "mafAddIRows", "mafAddQRows", "mafCoverage", "mafFetch", "mafFilter", "mafFrag", "mafFrags", "mafGene", "mafMeFirst", "mafNoAlign", "mafOrder", "mafRanges", "mafSpeciesList", "mafSpeciesSubset", "mafSplit", "mafSplitPos", "mafToAxt", "mafToBigMaf", "mafToPsl", "mafToSnpBed", "mafsInRegion", "makeTableList", "maskOutFa", "matrixClusterColumns", "matrixMarketToTsv", "matrixNormalize", "mktime", "mrnaToGene", "netChainSubset", "netClass", "netFilter", "netSplit", "netSyntenic", "netToAxt", "netToBed", "newProg", "newPythonProg", "nibFrag", "nibSize", "oligoMatch", "overlapSelect", "para", "paraFetch", "paraHub", "paraHubStop", "paraNode", "paraNodeStart", "paraNodeStatus", "paraNodeStop", "paraSync", "paraTestJob", "parasol", "positionalTblCheck", "pslCDnaFilter", "pslCat", "pslCheck", "pslDropOverlap", "pslFilter", "pslHisto", "pslLiftSubrangeBlat", "pslMap", "pslMapPostChain", "pslMrnaCover", "pslPairs", "pslPartition", "pslPosTarget", "pslPretty", "pslRc", "pslRecalcMatch", "pslRemoveFrameShifts", "pslReps", "pslScore", "pslSelect", "pslSomeRecords", "pslSort", "pslSortAcc", "pslStats", "pslSwap", "pslToBed", "pslToBigPsl", "pslToChain", "pslToPslx", "pslxToFa", "qaToQac", "qacAgpLift", "qacToQa", "qacToWig", "raSqlQuery", "raToLines", "raToTab", "randomLines", "rmFaDups", "rowsToCols", "sizeof", "spacedToTab", "splitFile", "splitFileByColumn", "sqlToXml", "strexCalc", "stringify", "subChar", "subColumn", "tabQuery", "tailLines", "tdbQuery", "tdbRename", "tdbSort", "textHistogram", "tickToDate", "toLower", "toUpper", "trackDbIndexBb", "transMapPslToGenePred", "trfBig", "twoBitDup", "twoBitInfo", "twoBitMask", "twoBitToFa", "ucscApiClient", "udr", "vai.pl", "validateFiles", "validateManifest", "varStepToBedGraph.pl", "webSync", "wigCorrelate", "wigEncode", "wigToBigWig", "wordLine", "xmlCat", "xmlToSql"}
local entrypoint_args = "env LANG=C.UTF-8"

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

-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
