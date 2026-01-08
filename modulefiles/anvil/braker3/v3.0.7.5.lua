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

-- TODO: edit name, description, home page URL (in help and whatis)
help([==[

Description
===========
BRAKER3 enables the usage of RNA-seq and protein data in a fully automated pipeline to train and predict highly reliable genes with GeneMark-ETP and AUGUSTUS. The result of the pipeline is the combined gene set of both gene prediction tools, which only contains genes with very high support from extrinsic evidence.

More information
================
 - BioContainers: https://hub.docker.com/r/teambraker/braker3
 - Home page:     https://github.com/Gaius-Augustus/BRAKER

Note:
=====
Since BRAKER is a pipeline that trains AUGUSTUS, i.e. writes species
specific parameter files, BRAKER needs writing access to the configuration
directory of AUGUSTUS that contains such files.  This installation comes
with a stub of AUGUSTUS coniguration files, but you *must* copy them out
from the container into a location where you have write permissions.

A helper command 'copy_augustus_config' is provided to simplify the task.
Follow the procedure below to put the config files in your scratch space:

   $ mkdir -p $RCAC_SCRATCH/augustus
   $ copy_augustus_config $RCAC_SCRATCH/augustus
   $ export AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config

You would also pass the value via command-line (use the FULL path)
switch:
   $ braker.pl --AUGUSTUS_CONFIG_PATH=$RCAC_SCRATCH/augustus/config .....

Note: If this is your first time using BRAKER3, register at 
https://exon.gatech.edu/GeneMark/license_download.cgi to obtain a 
GeneMark-ES/ET/EP+ ver 4.72_lic license for Linux 64 kernel 3.10 - 5. 
Download the license file as gm_key_64 and place it in your home directory
as follows:

gunzip gm_key_64.gz
mv gm_key_64 ~/.gm_key

]==])

whatis("Name: Braker3")
whatis("Version: v3.0.7.5")
whatis("Description: Braker3 is BRAKER3 enables the usage of RNA-seq and protein data in a fully automated pipeline to train and predict highly reliable genes with GeneMark-ETP and AUGUSTUS. The result of the pipeline is the combined gene set of both gene prediction tools, which only contains genes with very high support from extrinsic evidence.")
whatis("BioContainers: https://biocontainers.pro/tools/braker3")
whatis("Home page:     https://github.com/Gaius-Augustus/BRAKER")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

-- TODO: check module conflicts (think older version, OpenMPI, etc)
conflict(myModuleName())

-- TODO: Add all necessary commands to the programs={} list!
--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "teambraker_braker3:v3.0.7.5.sif"
local uri = "docker://teambraker/braker3:v3.0.7.5"
local programs = {"braker.pl"}
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

-- TODO: Uncomment or delete these lines (only needed for MPI-enabled programs)
-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
pushenv("GENEMARK_PATH", "/opt/ETP/bin/gmes")
set_shell_function("copy_augustus_config",
                   "test -z $1"
                     .. " && " .. "echo \"Failed to copy AUGUSTUS configuration: must provide destination\" && return 1"
                     .. " || " .. container_launch .. " " .. "cp -r /opt/Augustus/config $1" .. " && "
                               .. "printf \"AUGUSTUS configuration copied. Remember to:\\n\\texport AUGUSTUS_CONFIG_PATH=$1/config\\n\"",

                   "test -z $1"
                     .. " && " .. "echo \"Failed to copy AUGUSTUS configuration: must provide destination\""
                     .. " || " .. container_launch .. " " .. "cp -r /opt/Augustus/config $1" .. " && "
                               .. "printf \"AUGUSTUS configuration copied. Remember to:\\n\\tsetenv AUGUSTUS_CONFIG_PATH $1/config\\n\"")

if (mode() == "load" and not os.getenv("AUGUSTUS_CONFIG_PATH")) then
    LmodMessage("Please remember to set AUGUSTUS_CONFIG_PATH - see note in 'module help " .. myModuleFullName() .. "'")
end

