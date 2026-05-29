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
REDItools v1.3 is a suite of Python scripts for detecting RNA editing events
from RNA-seq data (and optionally matched DNA-seq). It supports de novo
detection, DNA/RNA-paired calling, and known-site re-quantification, plus a
set of table/GFF accessory utilities used to filter, annotate, sort, and
index editing call tables.

This module runs the upstream tools inside an Apptainer/Singularity image
built from a Python 2.7 conda environment (pysam 0.15.4, samtools/htslib 1.9,
numpy 1.16.6, scipy 1.2.3, fisher 0.1.5).

Exposed commands
================
Core callers (main/):
  REDItoolDenovo.py    REDItoolDnaRna.py    REDItoolKnown.py

Nature Protocol runtime tools (NPscripts/):
  REDItoolDnaRnav13.py    collect_editing_candidates.py    get_Statistics.py

Accessory utilities (accessory/):
  AnnotateTable.py      FilterTable.py        GFFtoTabix.py
  SearchInTable.py      SortGFF.py            SortTable.py
  TableToGFF.py         get_DE_events.py      readPsl.py
  rediportal2recoding.py  selectPositions.py  subCount.py
  subCount2.py          tableToTabix.py

Note: invoke each script with its full name including the .py suffix
(e.g. "REDItoolDenovo.py -h"). The script's own current directory is bound
into the container, so input/output paths work as on the host.

Citations
=========
 - Picardi E, Pesole G. REDItools: high-throughput RNA editing detection
   made easy. Bioinformatics. 2013;29(14):1813-1814.
 - Lo Giudice C, Tangaro MA, Pesole G, Picardi E. Investigating RNA editing
   in deep transcriptome datasets with REDItools and REDIportal.
   Nat Protoc. 2020;15(3):1098-1131.

More information
================
 - Home page:     https://github.com/BioinfoUNIBA/REDItools
 - Documentation: https://github.com/BioinfoUNIBA/REDItools/blob/master/README_1.md
 - REDIportal:    http://srv00.recas.ba.infn.it/atlas/
]==])

whatis("Name: REDItools")
whatis("Version: 1.3")
whatis("Description: Python scripts for RNA editing detection from RNA-seq data (Python 2.7 runtime in Apptainer container)")
whatis("Home page:   https://github.com/BioinfoUNIBA/REDItools")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

-- Only one REDItools version may be loaded at a time
conflict(myModuleName())

local image = "arnstrm2_reditools1:1.3.sif"
local uri = "docker://arnstrm2/reditools1:1.3"

-- All 20 Python scripts on PATH inside the container, grouped by source dir.
local programs = {
   -- main/  (core callers)
   "REDItoolDenovo.py",
   "REDItoolDnaRna.py",
   "REDItoolKnown.py",

   -- NPscripts/  (Nature Protocol runtime tools, symlinked into /opt/REDItools/bin)
   "REDItoolDnaRnav13.py",
   "collect_editing_candidates.py",
   "get_Statistics.py",

   -- accessory/  (table and GFF utilities)
   "AnnotateTable.py",
   "FilterTable.py",
   "GFFtoTabix.py",
   "SearchInTable.py",
   "SortGFF.py",
   "SortTable.py",
   "TableToGFF.py",
   "get_DE_events.py",
   "readPsl.py",
   "rediportal2recoding.py",
   "selectPositions.py",
   "subCount.py",
   "subCount2.py",
   "tableToTabix.py",
}

local entrypoint_args = ""

-- The absolute path to Singularity is needed so it can be invoked on remote
-- nodes without the corresponding module necessarily being loaded.
-- Trim off the trailing newline.
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
   end
else
   -- Look for the image in the Singularity cache, and if not found
   -- download it when "singularity run" is invoked.
   image = uri
end

-- Determine Nvidia and/or AMD GPUs (REDItools is CPU-only, so neither flag
-- is strictly needed, but leaving the detection in place keeps this module
-- consistent with the other BIOC containers and avoids surprises if the
-- container is ever updated to use a GPU-enabled tool).
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

-- Assemble the container launch command
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Helper: list all available REDItools commands at load time.
-- Comment out if you find the load-time output noisy.
if (mode() == "load") then
   LmodMessage("REDItools 1.3 loaded. Run any of the .py scripts directly, e.g.:")
   LmodMessage("  REDItoolDenovo.py -h")
   LmodMessage("  REDItoolDnaRna.py -h")
   LmodMessage("Type 'module help reditools1' for the full command list.")
end
