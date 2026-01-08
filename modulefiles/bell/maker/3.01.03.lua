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
Maker is a portable and easily configurable genome annotation pipeline.

Note:
   To run MAKER  MPI, please use the below two lines:
        export SINGULARITYENV_LIBDIR="/depot/itap/datasets/Maker/RepeatMasker/Libraries"
        export APPTAINERENV_LIBDIR="/depot/itap/datasets/Maker/RepeatMasker/Libraries"
        srun -n XX singularity exec /apps/biocontainers/images/maker_3.01.03.sif maker

More information
================
 - Home page:  https://www.yandell-lab.org/software/maker.html
]==])

whatis("Name: Maker")
whatis("Version: 3.01.03")
whatis("Description: Maker is a portable and easily configurable genome annotation pipeline.")
whatis("Home page:     https://www.yandell-lab.org/software/maker.html")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"MAKER")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "maker_3.01.03.sif"
local uri = ""
local programs = {"AED_cdf_generator.pl", "TACC.PL", "cegma2zff", "chado2gff3", "compare_gff3_to_chado", "cufflinks2gff3", "fasta_merge", "fasta_tool", "genemark_gtf2gff3", "gff3_merge", "ipr_update_gff", "iprscan2gff3", "maker", "maker2chado", "maker2eval_gtf", "maker2jbrowse", "maker2wap", "maker2zff", "maker_functional_fasta", "maker_functional_gff", "maker_map_ids", "map2assembly", "map_data_ids", "map_fasta_ids", "map_gff_ids", "match2gene.pl", "quality_filter.pl", "split_gff3", "tophat2gff3", "train_augustus.pl", "zff2genbank.pl"}
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


-- Multinode support
-- setenv("OMPI_MCA_orte_launch_agent", container_launch .. " orted")

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end

-- Additional commands or environment variables, if any
pushenv("SINGULARITYENV_LIBDIR","/depot/itap/datasets/Maker/RepeatMasker/Libraries")
pushenv("APPTAINERENV_LIBDIR","/depot/itap/datasets/Maker/RepeatMasker/Libraries")
