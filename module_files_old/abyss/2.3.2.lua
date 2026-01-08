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
ABySS is a de novo sequence assembler intended for short paired-end reads
and genomes of all sizes.

More information
================
 - BioContainers: https://biocontainers.pro/tools/abyss
 - Home page:     https://github.com/bcgsc/abyss/
]==])

whatis("Name: Abyss")
whatis("Version: 2.3.2")
whatis("Description: ABySS is a de novo sequence assembler intended for short paired-end reads and genomes of all sizes.")
whatis("BioContainers: https://biocontainers.pro/tools/abyss")
whatis("Home page:     https://github.com/bcgsc/abyss/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

-- ABySS is MPI-enabled internally, but it must not be called with mpirun
-- ('abyss-pe' handles parallel launching behind the scenes), so we do not
-- conflict with OpenMPI module nor alias mpirun and mpiexec (but we do set
-- the OMPI_MCA_orte_launch_agent variable to enable multinode execution).
conflict(myModuleName(), "ABySS")

local image = "quay.io_biocontainers_abyss:2.3.2--hd403d74_0.sif"
local uri = "docker://quay.io/biocontainers/abyss:2.3.2--hd403d74_0"
local programs = {"ABYSS", "ABYSS-P", "AdjList", "Consensus",
                  "DAssembler", "DistanceEst", "DistanceEst-ssq", "KAligner",
		  "MergeContigs", "MergePaths", "Overlap", "ParseAligns",
		  "PathConsensus", "PathOverlap", "PopBubbles", "SimpleGraph",
		  "abyss-align", "abyss-bloom", "abyss-bloom-dbg",
		  "abyss-bowtie", "abyss-bowtie2", "abyss-bwa", "abyss-bwamem",
		  "abyss-bwasw", "abyss-db-txt", "abyss-dida", "abyss-fac",
		  "abyss-fatoagp", "abyss-filtergraph", "abyss-fixmate",
		  "abyss-fixmate-ssq", "abyss-gapfill", "abyss-gc",
		  "abyss-index", "abyss-junction", "abyss-kaligner",
		  "abyss-layout", "abyss-longseqdist", "abyss-map",
		  "abyss-map-ssq", "abyss-mergepairs", "abyss-overlap",
		  "abyss-paired-dbg", "abyss-paired-dbg-mpi", "abyss-pe",
		  "abyss-rresolver-short", "abyss-samtoafg",
		  "abyss-scaffold", "abyss-sealer", "abyss-stack-size",
		  "abyss-tabtomd", "abyss-todot", "abyss-tofastq",
		  "konnector", "logcounter"
                 }
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
setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
set_shell_function("abyss-db-csv", "echo \"'abyss-db-csv' is not available\"",
                                   "echo \"'abyss-db-csv' is not available\"")
