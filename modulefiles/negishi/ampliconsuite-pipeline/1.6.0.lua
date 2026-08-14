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
AmpliconSuite-pipeline is an end-to-end wrapper around AmpliconArchitect (AA)
and AmpliconClassifier (AC) for detecting and classifying focal copy number
amplifications, such as ecDNA and BFBs, from paired-end whole genome
sequencing data. Release 1.6.0 is a coordinated release of AA v1.6.r0,
AC v2.0.0 and BFBArchitect v1.0.1.

Supported reference builds: hg19, GRCh37, GRCh38 (hg38), GRCh38_viral, mm10.

Image provenance
================
Built at RCAC on 2026-08-13 from AmpliconSuite-pipeline/singularity/
ampliconsuite-pipeline.def, with Bootstrap changed from library to docker and
symlinks added to expose the driver scripts on PATH. The upstream def pulls
master/main branch archives rather than release tags, so this image is a
branch snapshot taken shortly after the v1.6.0 release, not a tagged build.
Run 'AmpliconSuite-pipeline.py -v' to see the versions actually installed.

Reference annotations
=====================
AA_DATA_REPO points at a shared, read-only site copy under
/depot/itap/datasets/ampliconsuite/data_repo. Because that copy is not
writable, AA cannot cache per-BAM coverage statistics into it. Pass
--no_cstats, or point AA_DATA_REPO and APPTAINERENV_AA_DATA_REPO at your own
writable copy.

The site copy tracks 'current', which is repointed as new annotation
snapshots are staged. If you need results reproducible against a fixed
snapshot, set AA_DATA_REPO to the dated directory instead.

Optimization solvers
====================
No commercial solver license is required. AA falls back to Clarabel and
BFBArchitect falls back to CBC. Pass --AA_solver clarabel to skip Mosek
detection entirely.

If you hold a personal academic Mosek license, the container looks for it at
/home/mosek/ inside the container, which is NOT your home directory. Bind it:

   export APPTAINER_BIND="$HOME/mosek:/home/mosek"

Typical usage
=============
   AmpliconSuite-pipeline.py -s SAMPLE -t 12 \
       --bam sample.cs.bam --ref GRCh38 \
       --AA_solver clarabel --no_cstats \
       --run_AA --run_AC \
       -o $CLUSTER_SCRATCH/ampliconsuite_out

AmpliconArchitect itself is largely serial. The -t value drives BWA, CNVkit
and samtools during data preparation, so a full-node request will sit idle
through the AA stage.

BAMs should be coordinate sorted and BWA-MEM aligned (do not set -m) against
a supported build. BAMs pulled from SRA are frequently stripped of tags that
AA needs to call breakpoints correctly.

More information
================
 - Home page: https://github.com/AmpliconSuite/AmpliconSuite-pipeline
 - Guide:     https://github.com/AmpliconSuite/AmpliconSuite-pipeline/blob/master/documentation/GUIDE.md
]==])

whatis("Name: AmpliconSuite-pipeline")
whatis("Version: 1.6.0")
whatis("Description: End-to-end wrapper for AmpliconArchitect and AmpliconClassifier; detects and classifies focal copy number amplifications such as ecDNA and BFB from paired-end WGS")
whatis("Bundles: AmpliconArchitect v1.6.r0, AmpliconClassifier v2.0.0, BFBArchitect v1.0.1")
whatis("Home page: https://github.com/AmpliconSuite/AmpliconSuite-pipeline")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

-- Locally built image. There is no pullable URI: this cannot be recreated by
-- a registry pull. The patched def lives alongside the image.
local image = "ampliconsuite-pipeline_1.6.0.sif"

-- Keep this table free of Lua comments: bioc_gen_wrappers.sh parses it with awk.
local programs = {
   "AmpliconSuite-pipeline.py",
   "GroupedAnalysisAmpSuite.py",
   "AmpliconArchitect.py",
   "amplified_intervals.py",
   "amplicon_classifier.py",
   "make_results_table.py",
   "feature_similarity.py",
   "BFBArchitect.py",
   "BFBArchitect-batch",
   "BFBArchitect-call-cnv",
   "cnvkit.py",
   "CAMPER.py",
   "breakpoints_to_bed.py",
   "convert_cns_to_bed.py",
   "cycles_to_bed.py",
   "graph_cleaner.py",
   "graph_to_bed.py",
   "plot_cnv_distribution.py",
   "bfb_foldback_detection.py",
   "integration_detection.py",
   "readclust.py",
}

local entrypoint_args = ""

local singularity = capture("which singularity | head -c -1")

if (os.getenv("BIOC_IMAGE_DIR")) then
   image = pathJoin(os.getenv("BIOC_IMAGE_DIR"), image)
   if not (isFile(image)) then
      LmodError("BIOC: image not found: " .. image ..
                "\nThis module requires a locally built SIF; it cannot be pulled from a registry.")
   end
else
   LmodError("BIOC: BIOC_IMAGE_DIR is not set. This module requires a locally built SIF.")
end

setenv("APPTAINERENV_LC_ALL",   "C")
setenv("SINGULARITYENV_LC_ALL", "C")

-- GPU detection omitted: AmpliconSuite has no GPU code path.

-- "exec" and not "run": the def defines no %runscript, and %environment is
-- applied under exec as well, so there is nothing an entrypoint would add.
-- bioc_gen_wrappers.sh must also emit "exec" wrappers for this module.
local container_launch = singularity .. " exec " .. image .. " " .. entrypoint_args

-- ---------------------------------------------------------------------------
-- AA reference annotation repository
-- ---------------------------------------------------------------------------
-- The image %environment exports AA_DATA_REPO=/home/data_repo into
-- 90-environment.sh, which overrides any plain inherited value. The
-- APPTAINERENV_/SINGULARITYENV_ forms land in 91-environment.sh and win.
local aa_data_repo = "/depot/itap/datasets/ampliconsuite/data_repo/current"

if (isDir(aa_data_repo)) then
   setenv("AA_DATA_REPO",                aa_data_repo)
   setenv("APPTAINERENV_AA_DATA_REPO",   aa_data_repo)
   setenv("SINGULARITYENV_AA_DATA_REPO", aa_data_repo)
elseif (mode() == "load") then
   LmodMessage("BIOC: AA data repo not found at " .. aa_data_repo)
   LmodMessage("BIOC: export AA_DATA_REPO and APPTAINERENV_AA_DATA_REPO before running.")
end

-- Not set here, already provided by the image %environment:
--   AA_SRC, AC_SRC, MOSEKLM_LICENSE_FILE, MPLCONFIGDIR, AS_NO_REPO_CHECK
-- AS_NO_REPO_CHECK=1 is what keeps the online data-repo freshness check from
-- stalling on compute nodes with no outbound route.

-- Expose wrappers on PATH for non-bash contexts (Perl, Python, Nextflow, etc.)
local wrapper_dir = pathJoin("/apps/biocontainers/exported-wrappers", myModuleName(), myModuleVersion())
if (isDir(wrapper_dir)) then
   prepend_path("PATH", wrapper_dir)
end

-- Programs to setup in the shell
for i,program in pairs(programs) do
    set_shell_function(program, container_launch .. " " .. program .. " \"$@\"",
                                container_launch .. " " .. program .. " $*")
end
