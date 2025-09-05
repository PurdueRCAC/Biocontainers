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
AlphaFold 3 is a biomolecular structure prediction pipeline developed by Google DeepMind, capable of predicting structures including proteins, nucleic acids, small molecules, ions and modified residues. 

More information
================
 - Home page:   https://github.com/google-deepmind/alphafold3
]==])

whatis("Name: AlphaFold")
whatis("Version: 3.0.1")
whatis("Description: AlphaFold 3 is a biomolecular structure prediction pipeline developed by Google DeepMind, capable of predicting structures including proteins, nucleic acids, small molecules, ions and modified residues.")
whatis("Home page:     https://github.com/google-deepmind/alphafold3")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "alphafold3_rcac_3.0.1.sif"
local uri = "/apps/biocontainers/images/alphafold3_rcac_3.0.1.sif"
local programs = {}
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

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

default_db_dir = "/depot/itap/datasets/alphafold3-databases/v3.0-20241105"
default_model_dir = "/depot/itap/datasets/alphafold3-deepmind-parameters"
defaults_suffix = "--model_dir="..default_model_dir.." --db_dir="..default_db_dir

bashcmdl = container_launch .. "python3 /app/alphafold/run_alphafold.py" .. " \"$@\" " .. defaults_suffix
cshcmdl  = container_launch .. "python3 /app/alphafold/run_alphafold.py" .. " $* " .. defaults_suffix

set_shell_function("run_alphafold.py", bashcmdl, cshcmdl)

if (mode() == "load") then
    LmodMessage([[

The AlphaFold 3 model parameters are made available under the AlphaFold 3 Model Parameters Terms of Use (the "Terms"); you may not use these except in compliance with the Terms. You may obtain a copy of the Terms at https://github.com/google-deepmind/alphafold3/blob/v3.0.1/WEIGHTS_TERMS_OF_USE.md.
]])

    if (not userInGroups("datasets-af3wghts", "alphafold3")) then
        LmodMessage([[
You are not registered to use this site installation of AF3 with DeepMind's parameters! To register, have your PI or equivalent send an email to rcac-help@purdue.edu with the subject line "AlphaFold3 access request" and a list of group members that need access.

Advanced users may supply their own custom trained models.
]])
    end
end

