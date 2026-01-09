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
Edta is developed for automated whole-genome de-novo TE annotation and benchmarking the annotation performance of TE libraries.

Note: Running EDTA, please use the command like this:
      	EDTA.pl [OPTIONS]
DO NOT call it 'perl EDTA.pl'


More information
================
 - BioContainers: https://biocontainers.pro/tools/edta
 - Home page:   https://github.com/oushujun/EDTA
]==])

whatis("Name: Edta")
whatis("Version: 2.0.0")
whatis("Description: Edta is developed for automated whole-genome de-novo TE annotation and benchmarking the annotation performance of TE libraries.")
whatis("BioContainers: https://biocontainers.pro/tools/edta")
whatis("Home page:     https://github.com/oushujun/EDTA")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(),"EDTA", "Edta")

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_edta:2.0.0--hdfd78af_0.sif"
local uri = "docker://quay.io/biocontainers/edta:2.0.0--hdfd78af_0"
local programs = {"EDTA.pl", "EDTA_processI.pl", "EDTA_raw.pl", "FET.pl", "bdf2gdfont.pl", "buildRMLibFromEMBL.pl", "buildSummary.pl", "calcDivergenceFromAlign.pl", "cd-hit-2d-para.pl", "cd-hit-clstr_2_blm8.pl", "cd-hit-div.pl", "cd-hit-para.pl", "check_result.pl", "clstr2tree.pl", "clstr2txt.pl", "clstr2xml.pl", "clstr_cut.pl", "clstr_list.pl", "clstr_list_sort.pl", "clstr_merge.pl", "clstr_merge_noorder.pl", "clstr_quality_eval.pl", "clstr_quality_eval_by_link.pl", "clstr_reduce.pl", "clstr_renumber.pl", "clstr_rep.pl", "clstr_reps_faa_rev.pl", "clstr_rev.pl", "clstr_select.pl", "clstr_select_rep.pl", "clstr_size_histogram.pl", "clstr_size_stat.pl", "clstr_sort_by.pl", "clstr_sort_prot_by.pl", "clstr_sql_tbl.pl", "clstr_sql_tbl_sort.pl", "convert_MGEScan3.0.pl", "convert_ltr_struc.pl", "convert_ltrdetector.pl", "createRepeatLandscape.pl", "down_tRNA.pl", "dupliconToSVG.pl", "filter_rt.pl", "genome_plot.pl", "genome_plot2.pl", "genome_plot_svg.pl", "getRepeatMaskerBatch.pl", "legacy_blast.pl", "lib-test.pl", "make_multi_seq.pl", "maskFile.pl", "plot_2d.pl", "plot_len1.pl", "rmOut2Fasta.pl", "rmOutToGFF3.pl", "rmToUCSCTables.pl", "update_blastdb.pl", "viewMSA.pl", "wublastToCrossmatch.pl"}
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
