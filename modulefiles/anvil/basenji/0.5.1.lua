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
Basenji is a tool for sequential regulatory activity predictions with deep convolutional neural networks.

More information
================
 - BioContainers: https://biocontainers.pro/tools/basenji
 - Home page:    https://github.com/calico/basenji
]==])

whatis("Name: Basenji")
whatis("Version: 0.5.1")
whatis("Description: Basenji is a tool for sequential regulatory activity predictions with deep convolutional neural networks.")
whatis("BioContainers: https://biocontainers.pro/tools/basenji")
whatis("Home page:     https://github.com/calico/basenji")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "quay.io_biocontainers_basenji:0.5.1--pyhdfd78af_0.sif"
local uri = "docker://quay.io/biocontainers/basenji:0.5.1--pyhdfd78af_0"
local programs = {"akita_data.py", "akita_data_read.py", "akita_data_write.py", "akita_predict.py", "akita_sat_plot.py", "akita_sat_vcf.py", "akita_scd.py", "akita_scd_multi.py", "akita_test.py", "akita_train.py", "bam_cov.py", "basenji_annot_chr.py", "basenji_bench_classify.py", "basenji_bench_gtex.py", "basenji_bench_gtex_cmp.py", "basenji_bench_phylop.py", "basenji_bench_phylop_folds.py", "basenji_cmp.py", "basenji_data.py", "basenji_data2.py", "basenji_data_align.py", "basenji_data_gene.py", "basenji_data_hic_read.py", "basenji_data_hic_write.py", "basenji_data_read.py", "basenji_data_write.py", "basenji_fetch_app.py", "basenji_fetch_app1.py", "basenji_fetch_app2.py", "basenji_fetch_norm.py", "basenji_fetch_vcf.py", "basenji_gtex_folds.py", "basenji_hdf5_genes.py", "basenji_hidden.py", "basenji_map.py", "basenji_map_genes.py", "basenji_map_seqs.py", "basenji_motifs.py", "basenji_motifs_denovo.py", "basenji_norm_h5.py", "basenji_predict.py", "basenji_predict_bed.py", "basenji_predict_bed_multi.py", "basenji_sad.py", "basenji_sad_multi.py", "basenji_sad_norm.py", "basenji_sad_ref.py", "basenji_sad_ref_multi.py", "basenji_sad_table.py", "basenji_sat_bed.py", "basenji_sat_bed_multi.py", "basenji_sat_folds.py", "basenji_sat_plot.py", "basenji_sat_plot2.py", "basenji_sat_vcf.py", "basenji_sed.py", "basenji_sed_multi.py", "basenji_sedg.py", "basenji_test.py", "basenji_test_folds.py", "basenji_test_genes.py", "basenji_test_reps.py", "basenji_test_specificity.py", "basenji_train.py", "basenji_train1.py", "basenji_train2.py", "basenji_train_folds.py", "basenji_train_hic.py", "basenji_train_reps.py", "save_model.py", "sonnet_predict_bed.py", "sonnet_sad.py", "sonnet_sad_multi.py", "sonnet_sat_bed.py", "sonnet_sat_vcf.py", "tfr_bw.py", "tfr_hdf5.py", "tfr_qc.py", "upgrade_tf1.py"}
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
