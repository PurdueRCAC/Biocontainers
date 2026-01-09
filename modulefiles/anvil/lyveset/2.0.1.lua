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
Lyveset is a method of using hqSNPs to create a phylogeny, especially for outbreak investigations.

More information
================
 - Docker hub:	https://hub.docker.com/r/staphb/lyveset
 - Home page:     https://github.com/lskatz/lyve-SET
]==])

whatis("Name: Lyveset")
whatis("Version: 2.0.1")
whatis("Description: Lyveset is a method of using hqSNPs to create a phylogeny, especially for outbreak investigations.")
whatis("Docker hub:  https://hub.docker.com/r/staphb/lyveset")
whatis("Home page:     https://github.com/lskatz/lyve-SET")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "staphb_lyveset:2.0.1.sif"
local uri = "docker://staphb/lyveset:2.0.1"
local programs = {"applyFstToTree.pl", "cladeDistancesFromTree.pl", "clusterPairwise.pl", "convertAlignment.pl", "downloadDataset.pl", "errorProneRegions.pl", "filterMatrix.pl", "filterVcf.pl", "genomeDist.pl", "launch_bwa.pl", "launch_set.pl", "launch_smalt.pl", "launch_snap.pl", "launch_snpeff.pl", "launch_varscan.pl", "makeRegions.pl", "matrixToAlignment.pl", "pairwiseDistances.pl", "pairwiseTo2d.pl", "removeUninformativeSites.pl", "removeUninformativeSitesFromMatrix.pl", "run_assembly_isFastqPE.pl", "run_assembly_metrics.pl", "run_assembly_readMetrics.pl", "run_assembly_removeDuplicateReads.pl", "run_assembly_shuffleReads.pl", "run_assembly_trimClean.pl", "set_bayesHammer.pl", "set_diagnose.pl", "set_diagnose_msa.pl", "set_downloadTestData.pl", "set_findCliffs.pl", "set_findPhages.pl", "set_indexCase.pl", "set_manage.pl", "set_processPooledVcf.pl", "set_samtools_depth.pl", "set_test.pl", "shuffleSplitReads.pl", "snpDistribution.pl", "vcfToAlignment.pl", "vcfutils.pl"}
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
