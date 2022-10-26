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
R is a system for statistical computation and graphics.

This is a r/4.2.0 singularity image with main R packages used in scRNAseq analysis installed. 

In this module, we have some R packages installed:
ADAPTS
BayesSpace
BiocManager
CellAnnotatoR
cellassign
celldex
CoGAPS
conos
DEsingle 
devtools
dittoSeq
doSNOW
DropletUtils
GSVA
harmony
iCellR
leidenbase
M3Drop
miQC
monocle3
muscat
Nebulosa
pagoda2
pcaMethods
PCAtools
preprocessCore
rliger
scCATCH
scCustomize
scDblFinder
scDD
scde
scDEA
sceasy
schex
SCHNAPPs
scHOT
scKirby
scMappR
scMCA
sctransform
Seurat
seurat-wrappers
Signac
sincell
SingleCellExperiment
SingleR
slingshot
SnapATAC
SoupX
splatter
tensorflow
terra
tidyverse
tricycle
velocyto.R
zellkonverter

================
 - Home page:     https://www.r-project.org/
]==])

whatis("Name: r-scrnaseq")
whatis("Version: 4.2.0")
whatis("Description: R is a system for statistical computation and graphics.")
whatis("Home page:     https://www.r-project.org/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "R", "R-bioconductor", "Rstudio", "r", "rstudio", "r-rstudio", "r-rnaseq", "r-scrnaseq")

local image = "r_4.2.0_scrnaseq.sif"
local uri = ""
local programs = {"R", "Rscript"}
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

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
--
-- Need these for X11 under Thinlinc
append_path("SINGULARITY_BIND", "/var/opt",  ',')
append_path("SINGULARITY_BIND", "/run/user", ',')

-- Use internal C and Fortran compiler for building source packages
-- by ensuring that outside compiler variables don't get inside
-- (otherwise source packages don't build).
-- Note: if you do that, make sure your R_LIBS_USER is set to a location that
-- is specific to this particular R and does not get picked up by
-- other R installations.  See an example of proper ~/.Rprofile at
-- https://www.rcac.purdue.edu/knowledge/bell/run/examples/apps/r/rprofile
pushenv("SINGULARITYENV_CC",  "")
pushenv("SINGULARITYENV_CXX", "")
pushenv("SINGULARITYENV_FC",  "")
pushenv("SINGULARITYENV_F77", "")
pushenv("SINGULARITYENV_F90", "")
pushenv("SINGULARITYENV_F95", "")

-- Ensure default values for thread numbers, otherwise performance suffers
-- (when cgroup-ed Slurm job tries to spawn `nproc` threads on a single core)
if (mode() == "load" ) then
    if os.getenv("OMP_NUM_THREADS") == nil then
        setenv("OMP_NUM_THREADS", 1)
    end
    if os.getenv("OPENBLAS_NUM_THREADS") == nil then
        setenv("OPENBLAS_NUM_THREADS", 1)
    end
end

