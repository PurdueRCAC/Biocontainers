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
fastStructure is an algorithm for inferring population structure from
large SNP genotype data. It is based on a variational Bayesian framework
for posterior inference and is written in Python2.x.

Note: programs "structure.py", "chooseK.py" and "distruct.py" are standalone
      executable and should be called by name directly ("structure.py", etc).
      DO NOT invoke them as "python structure.py", or as
      "python /usr/local/bin/structure.py", this will not work!

Note: This containers lacks X11 libraries, so GUI plots with 'distruct.py'
      do not work.  Instead, we need to tell the underlying Matplotlib
      to use a non-interactive plotting backend (to file).  The easiest and
      most flexible way is to use the MPLBACKEND environment variable:
          env MPLBACKEND="svg" distruct.py --output myplot.svg .......

      Available backends in this container:
          Backend  Filetypes   Description
          agg      png         raster graphics – high quality PNG output
          ps       ps eps      vector graphics – Postscript output
          pdf      pdf         vector graphics – Portable Document Format
          svg      svg         vector graphics – Scalable Vector Graphics
      Default MPLBACKEND="agg" (for PNG format output).

================
 - BioContainers: https://biocontainers.pro/tools/faststructure
 - Home page:     https://rajanil.github.io/fastStructure/
]==])

whatis("Name: fastStructure")
whatis("Version: 1.0")
whatis("Description: fastStructure is an algorithm for inferring population structure from large SNP genotype data. It is based on a variational Bayesian framework for posterior inference and is written in Python2.x.")
whatis("BioContainers: https://biocontainers.pro/tools/faststructure")
whatis("Home page:     https://rajanil.github.io/fastStructure/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "fastStructure")

local image = "quay.io_biocontainers_faststructure:1.0--py27h813d008_3.sif"
local uri = "docker://quay.io/biocontainers/faststructure:1.0--py27h813d008_3"
local programs = {"structure.py", "chooseK.py", "distruct.py"} 
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
-- Set Matplotlib backend (see help text).
local filler = string.gsub(myModuleName(), '.', ' ')
if (mode() == "load") then
   LmodMessage(myModuleName() .. ": " .. "Setting MPLBACKEND=\"agg\" for PNG output in distruct.py.")
   LmodMessage(filler ..         "  " .. "See 'module help " .. myModuleUsrName() .. "' for details and alternatives.")
   LmodMessage()
end
pushenv("MPLBACKEND", "agg")
