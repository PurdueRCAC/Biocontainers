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
BBTools is a suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data. 

More information
================
 - Docker hub:	https://hub.docker.com/r/staphb/bbtools
 - Home page:   https://jgi.doe.gov/data-and-tools/software-tools/bbtools/
]==])

whatis("Name: Bbtools")
whatis("Version: 39.00")
whatis("Description: BBTools is a suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data.")
whatis("Docker hub:  https://hub.docker.com/r/staphb/bbtools")
whatis("Home page:   https://jgi.doe.gov/data-and-tools/software-tools/bbtools/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "staphb_bbtools:39.00.sif"
local uri = "docker://staphb/bbtools:39.00"
local programs = {"Xcalcmem.sh", "a_sample_mt.sh", "addadapters.sh", "addssu.sh", "adjusthomopolymers.sh", "alltoall.sh", "analyzeaccession.sh", "analyzegenes.sh", "analyzesketchresults.sh", "applyvariants.sh", "bbcms.sh", "bbcountunique.sh", "bbduk.sh", "bbest.sh", "bbfakereads.sh", "bbmap.sh", "bbmapskimmer.sh", "bbmask.sh", "bbmerge-auto.sh", "bbmerge.sh", "bbnorm.sh", "bbrealign.sh", "bbrename.sh", "bbsketch.sh", "bbsplit.sh", "bbsplitpairs.sh", "bbstats.sh", "bbversion.sh", "bbwrap.sh", "bloomfilter.sh", "calcmem.sh", "calctruequality.sh", "callgenes.sh", "callpeaks.sh", "callvariants.sh", "callvariants2.sh", "clumpify.sh", "commonkmers.sh", "comparegff.sh", "comparesketch.sh", "comparessu.sh", "comparevcf.sh", "consect.sh", "consensus.sh", "countbarcodes.sh", "countgc.sh", "countsharedlines.sh", "crossblock.sh", "crosscontaminate.sh", "cutgff.sh", "cutprimers.sh", "decontaminate.sh", "dedupe.sh", "dedupe2.sh", "dedupebymapping.sh", "demuxbyname.sh", "diskbench.sh", "estherfilter.sh", "explodetree.sh", "fetchproks.sh", "filterassemblysummary.sh", "filterbarcodes.sh", "filterbycoverage.sh", "filterbyname.sh", "filterbysequence.sh", "filterbytaxa.sh", "filterbytile.sh", "filterlines.sh", "filterqc.sh", "filtersam.sh", "filtersilva.sh", "filtersubs.sh", "filtervcf.sh", "fixgaps.sh", "fungalrelease.sh", "fuse.sh", "gbff2gff.sh", "getreads.sh", "gi2ancestors.sh", "gi2taxid.sh", "gitable.sh", "grademerge.sh", "gradesam.sh", "icecreamfinder.sh", "icecreamgrader.sh", "icecreammaker.sh", "idmatrix.sh", "idtree.sh", "invertkey.sh", "kapastats.sh", "kcompress.sh", "keepbestcopy.sh", "khist.sh", "kmercountexact.sh", "kmercountmulti.sh", "kmercoverage.sh", "kmerfilterset.sh", "kmerlimit.sh", "kmerlimit2.sh", "kmerposition.sh", "kmutate.sh", "lilypad.sh", "loadreads.sh", "loglog.sh", "makechimeras.sh", "makecontaminatedgenomes.sh", "makepolymers.sh", "mapPacBio.sh", "matrixtocolumns.sh", "mergeOTUs.sh", "mergebarcodes.sh", "mergepgm.sh", "mergeribo.sh", "mergesam.sh", "mergesketch.sh", "mergesorted.sh", "msa.sh", "mutate.sh", "muxbyname.sh", "partition.sh", "phylip2fasta.sh", "pileup.sh", "plotflowcell.sh", "plotgc.sh", "postfilter.sh", "printtime.sh", "processfrag.sh", "processhi-c.sh", "processspeed.sh", "randomgenome.sh", "randomreads.sh", "readlength.sh", "readqc.sh", "reducesilva.sh", "reformat.sh", "reformatpb.sh", "removebadbarcodes.sh", "removecatdogmousehuman.sh", "removehuman.sh", "removehuman2.sh", "removemicrobes.sh", "removesmartbell.sh", "rename.sh", "renameimg.sh", "repair.sh", "replaceheaders.sh", "representative.sh", "rqcfilter.sh", "rqcfilter2.sh", "runhmm.sh", "samtoroc.sh", "seal.sh", "sendsketch.sh", "shred.sh", "shrinkaccession.sh", "shuffle.sh", "shuffle2.sh", "sketch.sh", "sketchblacklist.sh", "sketchblacklist2.sh", "sortbyname.sh", "splitbytaxa.sh", "splitnextera.sh", "splitribo.sh", "splitsam.sh", "splitsam4way.sh", "splitsam6way.sh", "stats.sh", "statswrapper.sh", "streamsam.sh", "subsketch.sh", "summarizecontam.sh", "summarizecoverage.sh", "summarizecrossblock.sh", "summarizemerge.sh", "summarizequast.sh", "summarizescafstats.sh", "summarizeseal.sh", "summarizesketch.sh", "synthmda.sh", "tadpipe.sh", "tadpole.sh", "tadwrapper.sh", "taxonomy.sh", "taxserver.sh", "taxsize.sh", "taxtree.sh", "testfilesystem.sh", "testformat.sh", "testformat2.sh", "tetramerfreq.sh", "textfile.sh", "translate6frames.sh", "unicode2ascii.sh", "unzip.sh", "vcf2gff.sh", "webcheck.sh"}
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
