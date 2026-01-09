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
HOMER is a suite of tools for Motif Discovery and next-gen sequencing analysis.
More information
================
 - Home page:  http://homer.ucsd.edu/homer/
]==])

whatis("Name: HOMER")
whatis("Version: 4.11")
whatis("Description: HOMER is a suite of tools for Motif Discovery and next-gen sequencing analysis.")
whatis("Home page:    http://homer.ucsd.edu/homer/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"HOMER")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "homer_4.11.sif"
local programs =  {"GenomeOntology.pl", "HomerConfig.pm", "HomerSVGLogo.pm", "SIMA.pl", "Statistics.pm", "addData.pl", "addDataHeader.pl", "addGeneAnnotation.pl", "addInternalData.pl", "addOligos.pl", "adjustPeakFile.pl", "adjustRedunGroupFile.pl", "analyzeChIP-Seq.pl", "analyzeHiC", "analyzeRNA.pl", "analyzeRepeats.pl", "annotateInteractions.pl", "annotatePeaks.pl", "annotateRelativePosition.pl", "annotateTranscripts.pl", "assignGeneWeights.pl", "assignGenomeAnnotation", "assignTSStoGene.pl", "batchAnnotatePeaksHistogram.pl", "batchFindMotifs.pl", "batchFindMotifsGenome.pl", "batchMakeHiCMatrix.pl", "batchMakeMultiWigHub.pl", "batchMakeTagDirectory.pl", "batchParallel.pl", "bed2DtoUCSCbed.pl", "bed2pos.pl", "bed2tag.pl", "blat2gtf.pl", "bridgeResult2Cytoscape.pl", "changeNewLine.pl", "checkPeakFile.pl", "checkTagBias.pl", "chopUpBackground.pl", "chopUpPeakFile.pl", "chopify.pl", "cleanUpPeakFile.pl", "cleanUpSequences.pl", "cluster2bed.pl", "cluster2bedgraph.pl", "combineGO.pl", "combineHubs.pl", "compareMotifs.pl", "condenseBedGraph.pl", "cons2fasta.pl", "conservationAverage.pl", "conservationPerLocus.pl", "convertCoordinates.pl", "convertIDs.pl", "convertOrganismID.pl", "createIGVhtml.pl", "duplicateCol.pl", "eland2tags.pl", "fasta2tab.pl", "fastq2fasta.pl", "filterListBy.pl", "filterTADsAndCPs.pl", "filterTADsAndLoops.pl", "filterTagDirectory.pl", "findGO.pl", "findGOtxt.pl", "findHiCCompartments.pl", "findHiCDomains.pl", "findHiCInteractionsByChr.pl", "findKnownMotifs.pl", "findMotifs.pl", "findMotifsGenome.pl", "findPeaks", "findRedundantBLAT.pl", "findTADsAndLoops.pl", "findTADsAndLoopsFromRelMatrix", "findTopMotifs.pl", "findcsRNATSS.pl", "flipPC1toMatch.pl", "freq2group.pl", "genericConvertIDs.pl", "genomeOntology", "getChrLengths.pl", "getConservedRegions.pl", "getDiffExpression.pl", "getDifferentialBedGraph.pl", "getDifferentialPeaks", "getDifferentialPeaksReplicates.pl", "getDistalPeaks.pl", "getFocalPeaks.pl", "getGWASoverlap.pl", "getGenesInCategory.pl", "getGenomeTilingPeaks", "getHiCcorrDiff.pl", "getHomerQCstats.pl", "getLikelyAdapters.pl", "getMappableRegions", "getMappingStats.pl", "getPartOfPromoter.pl", "getPeakTags", "getPos.pl", "getRandomReads.pl", "getSiteConservation.pl", "getTopPeaks.pl", "gff2pos.pl", "go2cytoscape.pl", "groupSequences.pl", "homer", "homer2", "homerTools", "joinFiles.pl", "loadGenome.pl", "loadPromoters.pl", "makeBigBedMotifTrack.pl", "makeBigWig.pl", "makeBinaryFile.pl", "makeHiCWashUfile.pl", "makeMetaGeneProfile.pl", "makeMultiWigHub.pl", "makeTagDirectory", "makeUCSCfile", "map-fastq.pl", "merge2Dbed.pl", "mergeData.pl", "mergePeaks", "motif2Jaspar.pl", "motif2Logo.pl", "old", "parseGTF.pl", "pos2bed.pl", "prepForR.pl", "preparseGenome.pl", "profile2seq.pl", "qseq2fastq.pl", "randRemoveBackground.pl", "randomizeGroupFile.pl", "randomizeMotifs.pl", "removeAccVersion.pl", "removeBadSeq.pl", "removeOutOfBoundsReads.pl", "removePoorSeq.pl", "removeRedundantPeaks.pl", "renamePeaks.pl", "resizePosFile.pl", "revoppMotif.pl", "rotateHiCmatrix.pl", "runHiCpca.pl", "sam2spliceJunc.pl", "scanMotifGenomeWide.pl", "scrambleFasta.pl","configureHomer.pl"}
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
local container_launch = singularity .. " run " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
append_path("SINGULARITY_BIND", "/depot/itap/datasets/homer/data:/usr/local/bin/homer/data", ',')

