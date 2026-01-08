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
Cd-hit is a very widely used program for clustering and comparing protein or nucleotide sequences.

More information
================
 - BioContainers: https://biocontainers.pro/tools/cd-hit
 - Home page:   https://github.com/weizhongli/cdhit 
]==])

whatis("Name: Cd-hit")
whatis("Version: 4.8.1")
whatis("Description: Cd-hit is a very widely used program for clustering and comparing protein or nucleotide sequences.")
whatis("BioContainers: https://biocontainers.pro/tools/cd-hit")
whatis("Home page:     https://github.com/weizhongli/cdhit")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_cd-hit:4.8.1--h2e03b76_5.sif"
local uri = "docker://quay.io/biocontainers/cd-hit:4.8.1--h2e03b76_5"
local programs = {"FET.pl","cd-hit","cd-hit-2d","cd-hit-2d-para.pl","cd-hit-454","cd-hit-clstr_2_blm8.pl","cd-hit-div","cd-hit-div.pl","cd-hit-est","cd-hit-est-2d","cd-hit-para.pl","clstr2tree.pl","clstr2txt.pl","clstr2xml.pl","clstr_cut.pl","clstr_list.pl","clstr_list_sort.pl","clstr_merge.pl","clstr_merge_noorder.pl","clstr_quality_eval.pl","clstr_quality_eval_by_link.pl","clstr_reduce.pl","clstr_renumber.pl","clstr_rep.pl","clstr_reps_faa_rev.pl","clstr_rev.pl","clstr_select.pl","clstr_select_rep.pl","clstr_size_histogram.pl","clstr_size_stat.pl","clstr_sort_by.pl","clstr_sort_prot_by.pl","clstr_sql_tbl.pl","clstr_sql_tbl_sort.pl","make_multi_seq.pl","plot_2d.pl","plot_len1.pl"}

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
