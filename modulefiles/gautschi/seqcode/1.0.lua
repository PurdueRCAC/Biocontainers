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
SeqCode is a family of applications designed to develop high-quality images and perform genome-wide calculations from high-throughput sequencing experiments. This software is presented into two distinct modes: web tools and command line. The website of SeqCode offers most functions to users with no previous expertise in bioinformatics, including operations on a selection of published ChIP-seq samples and applications to generate multiple classes of graphics from data files of the user. On the contrary, the standalone version of SeqCode allows bioinformaticians to run each command on any type of sequencing data locally in their computer. The architecture of the source code is modular and the input/output interface of the commands is suitable to be integrated into existing pipelines of genome analysis. SeqCode has been written in ANSI C, which favors the compatibility in every UNIX platform and grants a high performance and speed when analyzing sequencing data. Meta-plots, heatmaps, boxplots and the rest of images produced by SeqCode are internally generated using R. SeqCode relies on the RefSeq reference annotations and is able to deal with the genome and assembly release of every organism that is available from this consortium.

More information
================
 - Docker hub:	  https://hub.docker.com/r/eblancocrg/seqcode
 - Home page:     https://github.com/eblancoga/seqcode
]==])

whatis("Name: Seqcode")
whatis("Version: base")
whatis("Description: SeqCode is a family of applications designed to develop high-quality images and perform genome-wide calculations from high-throughput sequencing experiments.")
whatis("BioContainers: https://biocontainers.pro/tools/seqcode")
whatis("Home page:     https://github.com/eblancoga/seqcode")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "eblancocrg_seqcode:base.sif"
local uri = "docker://eblancocrg/seqcode:base"
local programs = {"buildChIPprofile", "combineChIPprofiles", "combineTSSmaps", "combineTSSplots", "computemaxsignal", "findPeaks", "genomeDistribution", "matchpeaks", "matchpeaksgenes", "processmacs", "produceGENEmaps", "produceGENEplots", "producePEAKmaps", "producePEAKplots", "produceTESmaps", "produceTESplots", "produceTSSmaps", "produceTSSplots", "recoverChIPlevels", "scorePhastCons"}
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
prepend_path("SINGULARITYENV_PREPEND_PATH","/seqcode/bin")
prepend_path("APPTAINERENV_PREPEND_PATH","/seqcode/bin")
