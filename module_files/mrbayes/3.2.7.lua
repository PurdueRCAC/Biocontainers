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
MrBayes is a program for Bayesian inference and model choice across a wide
range of phylogenetic and evolutionary models. MrBayes uses Markov chain
Monte Carlo (MCMC) methods to estimate the posterior distribution of model
parameters.

MrBayes is available both in a serial version ('mb') and in a parallel
version ('mb-mpi') that uses MPI instructions to distribute computations
across several processors or processor cores. The serial version does *not*
support multi-threading, which means that you will not be able to utilize
more than one core on a multi-core machine for a single MrBayes analysis.
If you want to utilize all cores,you need to run the MPI version of MrBayes.

Note:
   'mb-mpi' in this version of the container does not run across multiple
   nodes (only within a node). This is a bug in the container (upstream).

More information
================
 - BioContainers: https://biocontainers.pro/tools/mrbayes
 - Home page:     http://mrbayes.net
]==])

whatis("Name: Mrbayes")
whatis("Version: 3.2.7")
whatis("Description: MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. MrBayes uses Markov chain Monte Carlo (MCMC) methods to estimate the posterior distribution of model parameters.")
whatis("BioContainers: https://biocontainers.pro/tools/mrbayes")
whatis("Home page:     http://mrbayes.net")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "openmpi")

local image = "quay.io_biocontainers_mrbayes:3.2.7--h19cf415_2.sif"
local uri = "docker://quay.io/biocontainers/mrbayes:3.2.7--h19cf415_2"
local programs = {"mb", "mb-mpi", "mpirun", "mpiexec"}
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
-- TODO: At the moment (as of version 3.2.7) the container does not have
-- 'ssh' or 'rsh' installed, so 'mpirun mb-mpi' fails with a cryptic error:
-- 	The value of the MCA parameter "plm_rsh_agent" was set to a path
-- 	that could not be found:
--
-- 	  plm_rsh_agent: ssh : rsh
-- Bug filed:
--    https://github.com/BioContainers/containers/issues/404
--    https://github.com/bioconda/bioconda-recipes/issues/27786
-- Waiting for Bioconda to fix its recipe.
-- Meanwhile, masking this variable suppresses the error... but for now
-- we could only run MPI within a single node.
setenv("OMPI_MCA_plm_rsh_agent", "")

