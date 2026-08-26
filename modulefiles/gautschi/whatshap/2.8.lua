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
WhatsHap is a software for phasing genomic variants using DNA sequencing
reads, also called read-based phasing or haplotype assembly. It is
especially suitable for long reads, but works well with short reads too.

Notes
=====
Single entry point: 'whatshap <subcommand>' (phase, haplotag, stats,
polyphase, compare, genotype, split, ...). Run 'whatshap --help' for the
full subcommand list.

Polyploid phasing ('whatshap polyphase') needs an ILP solver; the bundled
PuLP/CBC solver is single-threaded and can dominate runtime on large VCFs.

Input BAM/CRAM and reference must live under a bind-mounted path
(/depot, /scratch and $HOME are bound by default on RCAC clusters).

More information
================
 - BioContainers: https://biocontainers.pro/tools/whatshap
 - Home page:     https://whatshap.readthedocs.io/
]==])

whatis("Name: WhatsHap")
whatis("Version: 2.8")
whatis("Description: WhatsHap is a software for phasing genomic variants using DNA sequencing reads, also called read-based phasing or haplotype assembly. It is especially suitable for long reads, but works well with short reads too.")
whatis("BioContainers: https://biocontainers.pro/tools/whatshap")
whatis("Home page:     https://whatshap.readthedocs.io/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "WhatsHap")

local image = "quay.io_biocontainers_whatshap:2.8--py39h2de1943_0.sif"
local uri = "docker://quay.io/biocontainers/whatshap:2.8--py39h2de1943_0"
local programs = {"whatshap"}
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
