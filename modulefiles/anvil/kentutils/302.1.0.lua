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
Kentutils: UCSC command line bioinformatic utilities.

More information
================
 - Docker hub:   https://hub.docker.com/r/genomicpariscentre/kentutils
 - Home page:    https://github.com/ENCODE-DCC/kentUtils
]==])

whatis("Name: Kentutils")
whatis("Version: 302.1.0")
whatis("Description: Kentutils: UCSC command line bioinformatic utilities.")
whatis("Docker hub:   https://hub.docker.com/r/genomicpariscentre/kentutils")
whatis("Home page:    https://github.com/ENCODE-DCC/kentUtils")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "genomicpariscentre_kentutils:302.1.0.sif"
local uri = "docker://genomicpariscentre/kentutils:302.1.0"
local programs = {"addCols", "ameme", "autoDtd", "autoSql", "autoXml", "ave", "aveCols", "axtChain", "axtSort", "axtSwap", "axtToMaf", "axtToPsl", "bedClip", "bedCommonRegions", "bedCoverage", "bedExtendRanges", "bedGeneParts", "bedGraphPack", "bedGraphToBigWig", "bedIntersect", "bedItemOverlapCount", "bedPileUps", "bedRemoveOverlap", "bedRestrictToPositions", "bedSort", "bedToBigBed", "bedToExons", "bedToGenePred", "bedToPsl", "bedWeedOverlapping", "bigBedInfo", "bigBedNamedItems", "bigBedSummary", "bigBedToBed", "bigWigAverageOverBed", "bigWigCat", "bigWigCorrelate", "bigWigInfo", "bigWigMerge", "bigWigSummary", "bigWigToBedGraph", "bigWigToWig", "blastToPsl", "blastXmlToPsl", "calc", "catDir", "catUncomment", "chainAntiRepeat", "chainFilter", "chainMergeSort", "chainNet", "chainPreNet", "chainSort", "chainSplit", "chainStitchId", "chainSwap", "chainToAxt", "chainToPsl", "checkAgpAndFa", "checkCoverageGaps", "checkHgFindSpec", "checkTableCoords", "chopFaLines", "chromGraphFromBin", "chromGraphToBin", "colTransform", "countChars", "crTreeIndexBed", "crTreeSearchBed", "dbSnoop", "dbTrash", "estOrient", "faCmp", "faCount", "faFilter", "faFilterN", "faFrag", "faNoise", "faOneRecord", "faPolyASizes", "faRandomize", "faRc", "faSize", "faSomeRecords", "faSplit", "faToFastq", "faToTab", "faToTwoBit", "faTrans", "fastqToFa", "featureBits", "fetchChromSizes", "findMotif", "gapToLift", "genePredCheck", "genePredHisto", "genePredSingleCover", "genePredToBed", "genePredToFakePsl", "genePredToGtf", "genePredToMafFrames", "gfClient", "gfServer", "gff3ToGenePred", "gff3ToPsl", "gmtime", "gtfToGenePred", "headRest", "hgFindSpec", "hgGcPercent", "hgLoadBed", "hgLoadOut", "hgLoadWiggle", "hgTrackDb", "hgWiggle", "hgsql", "hgsqldump", "htmlCheck", "hubCheck", "ixIxx", "lavToAxt", "lavToPsl", "ldHgGene", "liftOver", "liftOverMerge", "liftUp", "linesToRa", "linux.x86_64", "localtime", "mafAddIRows", "mafAddQRows", "mafCoverage", "mafFetch", "mafFilter", "mafFrag", "mafFrags", "mafGene", "mafMeFirst", "mafOrder", "mafRanges", "mafSpeciesList", "mafSpeciesSubset", "mafSplit", "mafSplitPos", "mafToAxt", "mafToPsl", "mafsInRegion", "makeTableList", "maskOutFa", "mktime", "mrnaToGene", "netChainSubset", "netClass", "netFilter", "netSplit", "netSyntenic", "netToAxt", "netToBed", "newProg", "nibFrag", "nibSize", "oligoMatch", "overlapSelect", "paraFetch", "paraSync", "positionalTblCheck", "pslCDnaFilter", "pslCat", "pslCheck", "pslDropOverlap", "pslFilter", "pslHisto", "pslLiftSubrangeBlat", "pslMap", "pslMrnaCover", "pslPairs", "pslPartition", "pslPretty", "pslRecalcMatch", "pslReps", "pslSelect", "pslSort", "pslStats", "pslSwap", "pslToBed", "pslToChain", "pslToPslx", "pslxToFa", "qaToQac", "qacAgpLift", "qacToQa", "qacToWig", "raSqlQuery", "raToLines", "raToTab", "randomLines", "rmFaDups", "rowsToCols", "sizeof", "spacedToTab", "splitFile", "splitFileByColumn", "sqlToXml", "stringify", "subChar", "subColumn", "tailLines", "tdbQuery", "textHistogram", "tickToDate", "toLower", "toUpper", "trfBig", "twoBitDup", "twoBitInfo", "twoBitMask", "twoBitToFa", "validateFiles", "validateManifest", "wigCorrelate", "wigEncode", "wigToBigWig", "wordLine", "xmlCat", "xmlToSql"}
local entrypoint_args = ""

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
