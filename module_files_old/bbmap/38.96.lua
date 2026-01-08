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
Bbmap is a short read aligner, as well as various other bioinformatic tools.

More information
================
 - BioContainers: https://biocontainers.pro/tools/bbmap
 - Home page:     https://sourceforge.net/projects/bbmap
]==])

whatis("Name: Bbmap")
whatis("Version: 38.96")
whatis("Description: Bbmap is a short read aligner, as well as various other bioinformatic tools.") 
whatis("BioContainers: https://biocontainers.pro/tools/bbmap")
whatis("Home page:     https://sourceforge.net/projects/bbmap")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"BBMap")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_bbmap:38.96--h5c4e2a8_1.sif"
local uri = "docker://quay.io/biocontainers/bbmap:38.96--h5c4e2a8_1"
local programs = {"addadapters.sh", "a_sample_mt.sh", "bbcountunique.sh", "bbduk.sh", "bbest.sh", "bbfakereads.sh", "bbmap.sh", "bbmapskimmer.sh", "bbmask.sh", "bbmerge-auto.sh", "bbmergegapped.sh", "bbmerge.sh", "bbnorm.sh", "bbqc.sh", "bbrealign.sh", "bbrename.sh", "bbsketch.sh", "bbsplitpairs.sh", "bbsplit.sh", "bbstats.sh", "bbversion.sh", "bbwrap.sh", "calcmem.sh", "calctruequality.sh", "callpeaks.sh", "callvariants2.sh", "callvariants.sh", "clumpify.sh", "commonkmers.sh", "comparesketch.sh", "comparevcf.sh", "consect.sh", "countbarcodes.sh", "countgc.sh", "countsharedlines.sh", "crossblock.sh", "crosscontaminate.sh", "cutprimers.sh", "decontaminate.sh", "dedupe2.sh", "dedupebymapping.sh", "dedupe.sh", "demuxbyname.sh", "diskbench.sh", "estherfilter.sh", "explodetree.sh", "filterassemblysummary.sh", "filterbarcodes.sh", "filterbycoverage.sh", "filterbyname.sh", "filterbysequence.sh", "filterbytaxa.sh", "filterbytile.sh", "filterlines.sh", "filtersam.sh", "filtersubs.sh", "filtervcf.sh", "fungalrelease.sh", "fuse.sh", "getreads.sh", "gi2ancestors.sh", "gi2taxid.sh", "gitable.sh", "grademerge.sh", "gradesam.sh", "idmatrix.sh", "idtree.sh", "invertkey.sh", "kcompress.sh", "khist.sh", "kmercountexact.sh", "kmercountmulti.sh", "kmercoverage.sh", "loadreads.sh", "loglog.sh", "makechimeras.sh", "makecontaminatedgenomes.sh", "makepolymers.sh", "mapPacBio.sh", "matrixtocolumns.sh", "mergebarcodes.sh", "mergeOTUs.sh", "mergesam.sh", "msa.sh", "mutate.sh", "muxbyname.sh", "normandcorrectwrapper.sh", "partition.sh", "phylip2fasta.sh", "pileup.sh", "plotgc.sh", "postfilter.sh", "printtime.sh", "processfrag.sh", "processspeed.sh", "randomreads.sh", "readlength.sh", "reducesilva.sh", "reformat.sh", "removebadbarcodes.sh", "removecatdogmousehuman.sh", "removehuman2.sh", "removehuman.sh", "removemicrobes.sh", "removesmartbell.sh", "renameimg.sh", "rename.sh", "repair.sh", "replaceheaders.sh", "representative.sh", "rqcfilter.sh", "samtoroc.sh", "seal.sh", "sendsketch.sh", "shred.sh", "shrinkaccession.sh", "shuffle.sh", "sketchblacklist.sh", "sketch.sh", "sortbyname.sh", "splitbytaxa.sh", "splitnextera.sh", "splitsam4way.sh", "splitsam6way.sh", "splitsam.sh", "stats.sh", "statswrapper.sh", "streamsam.sh", "summarizecrossblock.sh", "summarizemerge.sh", "summarizequast.sh", "summarizescafstats.sh", "summarizeseal.sh", "summarizesketch.sh", "synthmda.sh", "tadpipe.sh", "tadpole.sh", "tadwrapper.sh", "taxonomy.sh", "taxserver.sh", "taxsize.sh", "taxtree.sh", "testfilesystem.sh", "testformat2.sh", "testformat.sh", "tetramerfreq.sh", "textfile.sh", "translate6frames.sh", "unicode2ascii.sh", "webcheck.sh"}
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
