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
JACKS (Joint Analysis of CRISPR/Cas9 Knockout Screens) is a Bayesian method that
jointly infers per-gRNA efficacy and per-sample gene essentiality from pooled
CRISPR/Cas9 screen count data. Sharing gRNA efficacy across screens improves
essentiality estimates relative to per-screen methods, and pre-trained efficacies
for common libraries (Avana, GeCKOv2, Yusa v1.0, TKOv1, Whitehead) can be reused
on new screens.

Commands provided
=================
 - run_JACKS.py     run inference on a count matrix + replicate map + sgRNA map
 - plot_heatmap.py  render a per-gene heatmap from the run_JACKS.py pickle output

Environment variables set by this module
========================================
 - JACKS_HOME         /opt/jacks (inside the container)
 - JACKS_EXAMPLE_DIR  bundled example datasets
 - JACKS_REF_DIR      pre-trained gRNA efficacy files for --reffile

Example
=======
   module load jacks/0.2
   run_JACKS.py counts.tab repmap.tab counts.tab \
       --common_ctrl_sample=CTRL --gene_hdr=gene \
       --outprefix=results/screen --ctrl_genes=NEGv1.txt

   # reuse pre-trained efficacies for the Yusa v1.0 library
   run_JACKS.py counts.tab repmap.tab counts.tab \
       --common_ctrl_sample=CTRL --outprefix=results/screen \
       --reffile=$JACKS_REF_DIR/yusa_v10_grna_JACKS_results.txt

   plot_heatmap.py results/screen_JACKS_results_full.pickle KRAS results/KRAS.png

Notes
=====
 - Single-threaded. Request one core; OMP_NUM_THREADS is set to 1 unless you have
   already set it, to keep the bundled OpenBLAS from oversubscribing the node.
 - plot_heatmap.py writes matplotlib DEBUG lines to stderr. This is an upstream
   logging quirk, not an error.

Citation
========
Allen F, Behan F, Khodak A, et al. JACKS: joint analysis of CRISPR/Cas9 knockout
screens. Genome Research. 2019;29(3):464-471. doi:10.1101/gr.238923.118

More information
================
 - Container image: docker://arnstrm2/jacks:0.2
 - Home page:       https://github.com/felicityallen/JACKS
]==])

whatis("Name: JACKS")
whatis("Version: 0.2")
whatis("Description: Joint Analysis of CRISPR/Cas9 Knockout Screens: Bayesian joint inference of gRNA efficacy and gene essentiality")
whatis("Commands: run_JACKS.py, plot_heatmap.py")
whatis("Container image: docker://arnstrm2/jacks:0.2")
whatis("Home page: https://github.com/felicityallen/JACKS")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

local image = "arnstrm2_jacks:0.2.sif"
local uri = "docker://arnstrm2/jacks:0.2"
local programs = {"run_JACKS.py", "plot_heatmap.py"}
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

-- JACKS is pure-Python and single-threaded; the OpenBLAS bundled in the numpy
-- wheel will otherwise spawn one thread per visible core. Only set a default.
if not (os.getenv("OMP_NUM_THREADS")) then
   pushenv("OMP_NUM_THREADS", "1")
end
if not (os.getenv("OPENBLAS_NUM_THREADS")) then
   pushenv("OPENBLAS_NUM_THREADS", "1")
end

-- Paths inside the container image, exposed so users can reference the bundled
-- example data and pre-trained gRNA efficacy tables on the command line.
setenv("JACKS_HOME", "/opt/jacks")
setenv("JACKS_EXAMPLE_DIR", "/opt/jacks/example")
setenv("JACKS_REF_DIR", "/opt/jacks/reference_grna_efficacies")

-- Headless plotting; MPLCONFIGDIR must be writable inside the container.
setenv("MPLBACKEND", "Agg")

-- No GPU support in this image (numpy/scipy/matplotlib only), so no --nv/--rocm.
local run_args = {}

-- And assemble container command
local container_launch = singularity .. " exec " .. table.concat(run_args, " ") .. " " .. image .. " " .. entrypoint_args

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end
