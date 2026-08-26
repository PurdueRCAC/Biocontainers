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
MAFFT is a multiple sequence alignment program for amino acid or nucleotide
sequences, offering progressive (FFT-NS-2), iterative refinement (FFT-NS-i)
and consistency-based (L-INS-i, G-INS-i, E-INS-i) strategies.

Notes
=====
Threading: pass '--thread $SLURM_CPUS_PER_TASK'. '--thread -1'
autodetects host cores and will oversubscribe a shared allocation.

Scratch: MAFFT writes temporary files to /tmp by default, which is
node-shared on Negishi. Set MAFFT_TMPDIR to a per-job directory:
  export MAFFT_TMPDIR=$(mktemp -d ${TMPDIR:-/tmp}/mafft.XXXXXX)

Not functional in this build: 'mafft-xinsi' and 'mafft-qinsi' need the
MAFFT 'with-extensions' package (MXSCARNA/DAFS/Foldalign), and
'mafft-homologs.rb' / 'mafft-sparsecore.rb' need Ruby plus BLAST.
None of these are present in the conda build. They are listed here only
so the command name resolves; expect a runtime error if invoked.

More information
================
 - BioContainers: https://biocontainers.pro/tools/mafft
 - Home page:     https://mafft.cbrc.jp/alignment/software/
]==])

whatis("Name: MAFFT")
whatis("Version: 7.525")
whatis("Description: MAFFT is a multiple sequence alignment program for amino acid or nucleotide sequences, offering progressive (FFT-NS-2), iterative refinement (FFT-NS-i) and consistency-based (L-INS-i, G-INS-i, E-INS-i) strategies.")
whatis("BioContainers: https://biocontainers.pro/tools/mafft")
whatis("Home page:     https://mafft.cbrc.jp/alignment/software/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "MAFFT")

local image = "quay.io_biocontainers_mafft:7.525--h031d066_1.sif"
local uri = "docker://quay.io/biocontainers/mafft:7.525--h031d066_1"
local programs = {"einsi", "fftns", "fftnsi", "ginsi", "linsi", "mafft",
                  "mafft-distance", "mafft-einsi", "mafft-fftns",
                  "mafft-fftnsi", "mafft-ginsi", "mafft-homologs.rb",
                  "mafft-linsi", "mafft-nwns", "mafft-nwnsi",
                  "mafft-profile", "mafft-qinsi", "mafft-sparsecore.rb",
                  "mafft-xinsi", "nwns", "nwnsi",
                 }
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
-- NOTE: "exec" (not "run"). "run" invokes the image runscript/CMD and would
-- pass the program name as an argument to it. Verify per image with:
--   singularity inspect --runscript <image>.sif
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
