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
QuickMIRSeq is an integrated pipeline for quick and accurate quantification
of known miRNAs and isomiRs by jointly processing multiple samples.

This module defines program installation directory (note: inside the
container!) as environment variable $QuickMIRSeq.  Once again, this is not
a host path, this path is only available from inside the container.  With
the way this module is organized, you should be able to use the variable
freely for both the
      perl  $QuickMIRSeq/QuickMIRSeq.pl  allIDs.txt run.config
and the
      $QuickMIRSeq/QuickMIRSeq-report.sh
steps as directed by the user guide.  A simple 'QuickMIRSeq.pl' and
'QuickMIRSeq-report.sh' will also work (and can be a backup if the variable
expansion somehow does not work for you).

You will also need a run configuration file.  You can copy from an existing
one, or take from the user guide, or as a last resort, use Singularity to copy
the template (in $QuickMIRSeq/run.config.template) from inside the container
image.  'singularity shell' may be an easiest way for the latter.

More information
================
 - BioContainers: https://hub.docker.com/r/gcfntnu/quickmirseq
 - Home page:     https://baohongz.github.io/guide/QuickMIRSeq.html
]==])

whatis("Name: QuickMIRSeq")
whatis("Version: 1.0")
whatis("Description: Quickmirseq is an integrated pipeline for quick and accurate quantification of known miRNAs and isomiRs by jointly processing multiple samples.")
whatis("BioContainers: https://hub.docker.com/r/gcfntnu/quickmirseq")
whatis("Home page:     https://baohongz.github.io/guide/QuickMIRSeq.html")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "QuickMIRSeq", "bioperl", "perl", "perl-bioperl")

local image = "gcfntnu_quickmirseq:1.0.sif"
local uri = "docker://gcfntnu/quickmirseq:1.0"
-- Using both path-less and full path name for QuickMIRSeq-report.sh script,
-- so both will get defined as aliases.  Hacky and slightly confusing, but
-- will help if people follow the "$QuickMIRSeq/QuickMIRSeq-report.sh" step
-- verbatim (as directed by the user guide)
local instdir = "/opt/QuickMIRSeq"
local programs = {"perl", "QuickMIRSeq-report.sh",
                  pathJoin(instdir, "QuickMIRSeq-report.sh"),
                 }
-- Container has C, C.UTF-8 and POSIX locales - force to avoid Perl warnings.
local entrypoint_args = "env LANG=C.UTF-8"

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
setenv("TINI_SUBREAPER", "1")
pushenv("QuickMIRSeq", instdir)

-- In this container, /opt/QuickMIRSeq/QuickMIRSeq.pl (the main program!)
-- is an executable, but it does NOT HAVE a shebang ('#!/usr/bin/env perl').
-- So we need to alias it with "perl ....." (which *is* the way documentation
-- says to call it, but having a direct alias is handy).  Two aliases below
-- are identical (one for just program name, one for full path).
local special_programs = { "QuickMIRSeq.pl", pathJoin(instdir, "QuickMIRSeq.pl") }
for i,program in pairs(special_programs) do
    set_shell_function(program, "perl" .. " " .. pathJoin(instdir, "QuickMIRSeq.pl") .. " \"$@\"",
                                "perl" .. " " .. pathJoin(instdir, "QuickMIRSeq.pl") .. " $*")
end

