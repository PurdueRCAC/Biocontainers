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
Funannotate is a genome prediction, annotation, and comparison software package. 

More information
================
 - Docker hub:	https://hub.docker.com/r/nextgenusfs/funannotate
 - Home page:     https://github.com/nextgenusfs/funannotate

Note:
=====
For some steps, Funannotate needs to trains AUGUSTUS, i.e. writes species
specific parameter files. Funannotate needs writing access to the configuration
directory of AUGUSTUS that contains such files.  This installation comes
with a stub of AUGUSTUS coniguration files, but you *must* copy them out
from the container into a location where you have write permissions.

A helper command 'copy_augustus_config' is provided to simplify the task.
Follow the procedure below to put the config files in your scratch space:

   $ mkdir -p $RCAC_SCRATCH/augustus
   $ copy_augustus_config $RCAC_SCRATCH/augustus
   $ export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config


Note: If you want to use GeneMark-ES/ET for prediction, please register at
https://exon.gatech.edu/GeneMark/license_download.cgi to obtain a
GeneMark-ES/ET/EP+ ver 4.72_lic license for Linux 64 kernel 3.10 - 5.
Download the license file as gm_key_64 and place it ~/.gm_key (home directory).


]==])

whatis("Name: Funannotate")
whatis("Version: v1.8.17")
whatis("Description: Funannotate is genome prediction, annotation, and comparison software package.")
whatis("Docker hub:  https://hub.docker.com/r/nextgenusfs/funannotate")
whatis("Home page:     https://github.com/nextgenusfs/funannotate")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "nextgenusfs_funannotate_patched:v1.8.17.sif"
local programs = {"funannotate"}
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
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
pushenv("SINGULARITYENV_EGGNOG_DATA_DIR","/depot/itap/datasets/eggnog-mapper-data")
set_shell_function("copy_augustus_config",
                   "test -z $1"
                     .. " && " .. "echo \"Failed to copy AUGUSTUS configuration: must provide destination\" && return 1"
                     .. " || " .. container_launch .. " " .. "cp -r /usr/share/augustus/config $1" .. " && "
                               .. "printf \"AUGUSTUS configuration copied. Remember to:\\n\\texport AUGUSTUS_CONFIG_PATH=$1/config\\n\"",

                   "test -z $1"
                     .. " && " .. "echo \"Failed to copy AUGUSTUS configuration: must provide destination\""
                     .. " || " .. container_launch .. " " .. "cp -r /usr/share/augustus/config $1" .. " && "
                               .. "printf \"AUGUSTUS configuration copied. Remember to:\\n\\tsetenv AUGUSTUS_CONFIG_PATH $1/config\\n\"")

-- if (mode() == "load" and not os.getenv("AUGUSTUS_CONFIG_PATH")) then
--    LmodMessage("Please remember to set AUGUSTUS_CONFIG_PATH - see important instructions in 'module help " .. myModuleFullName() .. "'")
-- end
