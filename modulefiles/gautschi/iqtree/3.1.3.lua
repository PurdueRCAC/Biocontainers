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
IQ-TREE is efficient phylogenomic software for maximum-likelihood tree
inference, with model selection (ModelFinder), ultrafast bootstrap, mixture
models, concordance factors and sequence simulation (AliSim).

Notes
=====
This package installs BOTH 'iqtree3' and a legacy-named 'iqtree' wrapper;
both are exposed by this module and are the same binary.

Threading: use '-T <n>' matched to your Slurm allocation, e.g.
  iqtree3 -s aln.fa -m MFP -B 1000 -T $SLURM_CPUS_PER_TASK
'-T AUTO' probes the whole node and will oversubscribe a shared job.

IQ-TREE 3 is not checkpoint-compatible with 2.x. Delete stale .ckp.gz
files before re-running an analysis that was started under iqtree/2.x.

More information
================
 - BioContainers: https://biocontainers.pro/tools/iqtree
 - Home page:     https://iqtree.github.io/
]==])

whatis("Name: IQ-TREE")
whatis("Version: 3.1.3")
whatis("Description: IQ-TREE is efficient phylogenomic software for maximum-likelihood tree inference, with model selection (ModelFinder), ultrafast bootstrap, mixture models, concordance factors and sequence simulation (AliSim).")
whatis("BioContainers: https://biocontainers.pro/tools/iqtree")
whatis("Home page:     https://iqtree.github.io/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "IQ-TREE")

local image = "quay.io_biocontainers_iqtree:3.1.3--h8471819_0.sif"
local uri = "docker://quay.io/biocontainers/iqtree:3.1.3--h8471819_0"
local programs = {"iqtree", "iqtree3"}
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
-- NOTE: "exec" (not "run"). "run" invokes the image runscript/CMD and would
-- pass the program name as an argument to it. Verify per image with:
--   singularity inspect --runscript <image>.sif
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
