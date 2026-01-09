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
Easymap v2 — A web-based and command-line tool for mapping-by-sequencing,
SNP/indel identification, and linkage analysis.

This module provides access to the Easymap v2 container and the
run_easymap server launcher used by OnDemand.

More information
================
  - GitHub: https://github.com/MicolLab/easymap
  - Documentation: http://genetics.edu.umh.es/resources/easymap/

]==])

whatis("Name: Easymap")
whatis("Version: 2.0")
whatis("Description: Easymap v2 mapping-by-sequencing and variant analysis toolkit")
whatis("Home page: http://genetics.edu.umh.es/resources/easymap/")
whatis("GitHub: https://github.com/MicolLab/easymap")

----------------------------------------------------------------------
-- Load Singularity / Apptainer support
----------------------------------------------------------------------

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "easymap")

----------------------------------------------------------------------
-- Container image
----------------------------------------------------------------------

local image = "easymap.v2.sif"
local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)
   if not (isFile(image)) then
      if (mode() == "load") then
         LmodError("Easymap v2 container not found in BIOC_IMAGE_DIR.")
      end
   end
else
   image = "/apps/biocontainers/images/easymap.v2.sif"
end

----------------------------------------------------------------------
-- GPU support (not needed but kept for consistency)
----------------------------------------------------------------------

local run_args = {}
if (capture("nvidia-smi -L 2>/dev/null") ~= "") then
   table.insert(run_args, "--nv")
end
if (capture("/opt/rocm/bin/rocm-smi -i 2>/dev/null | grep ^GPU") ~= "") then
   table.insert(run_args, "--rocm")
end

----------------------------------------------------------------------
-- Construct container launch command
----------------------------------------------------------------------

local container_launch = singularity .. " exec " ..
                         table.concat(run_args, " ") .. " " ..
                         image

----------------------------------------------------------------------
-- Provide ONLY the web-server launcher
----------------------------------------------------------------------

set_shell_function("run_easymap",
                   container_launch .. " run_easymap \"$@\"",
                   container_launch .. " run_easymap $*")

----------------------------------------------------------------------
-- Environment variables exposed to OOD
----------------------------------------------------------------------

setenv("EASYMAP_SIF", image)

if (mode() == "load") then
   LmodMessage("Easymap v2 module loaded. Use `run_easymap` to start the web server.")
end
