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
DeconSeq: DECONtamination of SEQuence data using a modified version of BWA-SW.
The DeconSeq tool can be used to automatically detect and efficiently remove sequence contamination from genomic and metagenomic datasets. It is easily configurable and provides a user-friendly interface.

More information
================
 - Home page:    http://deconseq.sourceforge.net/

Note:
=====
A helper command 'copy_DeconSeqConfig' is provided to copy the configuration file DeconSeqConfig.pm and executables to your current directory and modify it as needed.
You just need to simply run the command 'copy_DeconSeqConfig', no extra parameter is needed. 

]==])

whatis("Name: DeconSeq")
whatis("Version: 0.4.3")
whatis("Description: DeconSeq: DECONtamination of SEQuence data using a modified version of BWA-SW.")
whatis("Home page:   http://deconseq.sourceforge.net/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "deconseq_0.4.3.sif"
local uri = ""
local programs = {"bwa64", "deconseq.pl", "splitFasta.pl"}
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

--Bind current directory to /opt/deconseq-standalone-0.4.3
table.insert(run_args, "-B $PWD:/opt/deconseq-standalone-0.4.3") 

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
set_shell_function("copy_DeconSeqConfig",
  container_launch .. " " .. "cp /depot/itap/datasets/deconseq-standalone-0.4.3/DeconSeqConfig.pm /depot/itap/datasets/deconseq-standalone-0.4.3/*.pl /depot/itap/datasets/deconseq-standalone-0.4.3/bwa64 $PWD" .. " && "
                               .. "printf \"DeconSeqConfig.pm, splitFasta.pl, deconseq.pl and bwa64 have been copied to the current directory. \\n\"",
  container_launch .. " " .. "cp /depot/itap/datasets/deconseq-standalone-0.4.3/DeconSeqConfig.pm  /depot/itap/datasets/deconseq-standalone-0.4.3/*.pl /depot/itap/datasets/deconseq-standalone-0.4.3/bwa64 $PWD" .. " && "
                               .. "printf \"DeconSeqConfig.pm, splitFasta.pl, deconseq.pl and bwa64 have been copied to the current directory. \\n\"")

if (mode() == "load") then
    LmodMessage("Please remember to copy DeconSeqConfig.pm to the current directory - see note in 'module help " .. myModuleFullName() .. "'")
end

