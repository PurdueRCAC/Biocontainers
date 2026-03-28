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

-- TODO: edit name, description, home page URL (in help and whatis)
help([==[

Description
===========
BSAseq: Bulk Segregant Analysis for QTL mapping from pooled whole-genome sequencing data

More information
================
 - BioContainers: https://biocontainers.pro/tools/bsaseq
 - Home page:     https://github.com/rcac-bioinformatics/bsaseq
]==])

whatis("Name: Bsaseq")
whatis("Version: 1.0.0")
whatis("Description: BSAseq: Bulk Segregant Analysis for QTL mapping from pooled whole-genome sequencing data")
whatis("BioContainers: https://biocontainers.pro/tools/bsaseq")
whatis("Home page:     https://github.com/rcac-bioinformatics/bsaseq")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

local image = "arnstrm2_bsaseq_1.0.0.sif"
local uri = "docker://arnstrm2/bsaseq:latest"
local programs = {"bsaseq", "snpEff", "snpSift"}
local entrypoint_args = ""

-- snpEff database directory: user can override by setting SNPEFF_DATA_DIR before loading
-- Default: shared admin-managed path; set SNPEFF_DATA_DIR=$PWD to use current directory
local snpeff_data_default = "/apps/biocontainers/extras/bsaseq/1.0.0"
local snpeff_data = os.getenv("SNPEFF_DATA_DIR") or snpeff_data_default


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

-- Bind-mount writable snpEff data directory over read-only container path
table.insert(run_args, "--bind " .. snpeff_data .. ":/opt/snpEff/data")

-- And assemble container command
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- TODO: Uncomment or delete these lines (only needed for MPI-enabled programs)
-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Expose wrappers on PATH for non-bash contexts (Perl, Python, Nextflow, etc.)
local wrapper_dir = pathJoin("/apps/biocontainers/exported-wrappers", myModuleName(), myModuleVersion())
if (isDir(wrapper_dir)) then
   prepend_path("PATH", wrapper_dir)
end

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
setenv("SNPEFF_DATA_DIR", snpeff_data)
