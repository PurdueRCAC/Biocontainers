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

This is an r-ver:4.3.3 singularity image with RStudio and various R packages used in RNAseq analysis installed. 

RStudio is an integrated development environment (IDE) for the R statistical
computation and graphics system.

This is an RStudio IDE together with a plain R-base installation (see
https://github.com/rocker-org/rocker/), repackaged by RCAC with an addition
of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2
libXt, etc.) and their header files.

In this module, we have various relevant R packages installed, including:
             beachmat      2.18.1
          BiocManager     1.30.22
           cellranger       1.1.0
       ComplexHeatmap      2.18.0
               dbplyr       2.5.0
               DESeq2      1.42.1
               DEXSeq      1.48.0
               dtplyr       1.3.1
                edgeR      4.0.16
      EnhancedVolcano      1.20.0
           genefilter      1.84.0
          geneplotter      1.80.0
         GenomeInfoDb      1.38.8
    GenomicAlignments      1.38.2
        GenomicRanges      1.54.1
              ggplot2       3.5.0
             KEGGREST      1.42.0                                                                                                                                                             
                limma      3.58.1                                                                                                                                                             
             openxlsx     4.2.5.2                                                                                                                                                             
             PCAtools      2.14.0                                                                                                                                                             
             pheatmap      1.0.12                                                                                                                                                             
                readr       2.1.5
               readxl       1.4.3
            Rsamtools      2.18.0
              stringr       1.5.1
 SummarizedExperiment      1.32.0
               tibble       3.2.1
                tidyr       1.3.1

More information
================
 - Home page:     https://www.rstudio.com/products/rstudio/
 - Home page:     https://www.r-project.org/
]==])

whatis("Name:  r-rnaseq")
whatis("Version: 4.3.3-1-rstudio-2023.12.1")
whatis("Description: RStudio is an integrated development environment (IDE) for the R statistical computation and graphics system.")
whatis("Home page:     https://www.rstudio.com/products/rstudio/")
whatis("Home page:     https://www.r-project.org/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "R", "R-bioconductor", "Rstudio", "r", "rstudio", "r-rstudio", "r-scrnaseq")

local image = "r_4.3.3_rstudio-rnaseq.sif"
local uri = ""
local programs = {"R", "Rscript"}
local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
-- Trim off the training newline.
local singularity = capture("which apptainer | head -c -1")

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
for i,program in pairs({"rstudio"}) do
    set_shell_function(program, container_launch .. " " .. program .. " --no-sandbox \"$@\"",
                                container_launch .. " " .. program .. " --no-sandbox $*")
end

-- Additional commands or environment variables, if any
--
-- Need these for X11 under Thinlinc
append_path("APPTAINER_BIND", "/var/opt",  ',')
append_path("APPTAINER_BIND", "/run", ',')

-- Use internal C and Fortran compiler for building source packages
-- by ensuring that outside compiler variables don't get inside
-- (otherwise source packages don't build).
-- Note: if you do that, make sure your R_LIBS_USER is set to a location that
-- is specific to this particular R and does not get picked up by
-- other R installations.  See an example of proper ~/.Rprofile at
-- https://www.rcac.purdue.edu/knowledge/bell/run/examples/apps/r/rprofile
pushenv("APPTAINERENV_CC",  "")
pushenv("APPTAINERENV_CXX", "")
pushenv("APPTAINERENV_FC",  "")
pushenv("APPTAINERENV_F77", "")
pushenv("APPTAINERENV_F90", "")
pushenv("APPTAINERENV_F95", "")

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

-- RStudio needs access to the host' X11 fonts, otherwise terminal
-- and editor tabs get badly garbled.
append_path("APPTAINER_BIND", "/usr/share/fonts", ',')

-- Various R packages are kept outside the image, so reference them here 
append_path("R_LIBS_USER", "/apps/biocontainers/extras/r-package-site-library/r-rnaseq-4.3.3-1-rstudio-2023.12.1", ':')
