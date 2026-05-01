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
MOSHPIT (MOdular SHotgun metagenome Pipelines with Integrated provenance
Tracking) is the QIIME 2 distribution for whole-metagenome shotgun (WMS)
analysis. It provides q2-assembly and q2-annotate plus accessory plugins for
read QC, contig assembly (MEGAHIT/SPAdes), assembly evaluation (metaQUAST,
BUSCO), binning, taxonomic classification (Kraken 2, Kaiju, mOTUs 3), and
functional annotation (eggNOG + DIAMOND), all with full QIIME 2 provenance
tracking. The single command-line entry point is "qiime".

More information
================
 - BioContainers: https://biocontainers.pro/tools/moshpit
 - Home page:     https://moshpit.qiime2.org
 - Docs:          https://moshpit.readthedocs.io
 - Library:       https://library.qiime2.org/quickstart/moshpit
]==])

whatis("Name: Moshpit")
whatis("Version: 2026.4")
whatis("Description: QIIME 2 distribution for whole-metagenome shotgun (WMS) analysis (assembly, binning, taxonomic and functional annotation) with provenance tracking.")
whatis("BioContainers: https://biocontainers.pro/tools/moshpit")
whatis("Home page:     https://moshpit.qiime2.org")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())
conflict("qiime2")  -- avoid clashing with the amplicon/other QIIME 2 distro modules that also ship `qiime`

local image = "quay.io_qiime2_moshpit:2026.4.sif"
local uri = "docker://quay.io/qiime2/moshpit:2026.4"
local programs = {"qiime"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)

   if not (isFile(image)) then
      if (mode() == "load") then
         LmodMessage("file not found: " .. image)
         LmodMessage("The container image will be pulled upon first use to the Singularity cache")
      end
      image = uri
   end
else
   image = uri
end

-- Determine Nvidia and/or AMD GPUs (kept for forward-compat; MOSHPIT itself
-- is CPU-bound, but exposes GPUs to the container if present).
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

local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- MPI section deleted: MOSHPIT plugins parallelize via Parsl, not MPI.
