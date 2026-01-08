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
CirComPara2 is a computational pipeline to detect, quantify, and correlate expression of linear and circular RNAs from RNA-seq data that combines multiple circRNA-detection methods.

More information
================
 - Home page: https://github.com/egaffo/circompara2
]==])

whatis("Name: CirComPara2")
whatis("Version: 0.1.2.1")
whatis("Description: CirComPara2 is a computational pipeline to detect, quantify, and correlate expression of linear and circular RNAs from RNA-seq data that combines multiple circRNA-detection methods.")
whatis("Home page:   https://github.com/egaffo/circompara2")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "circompara2_0.1.2.1.sif"
local uri = ""
local programs = {"python","Rscript","circompara2", "CIRCexplorer2", "CIRCexplorer_compare.R", "CIRI.pl", "DCC", "DCC_patch_CombineCounts.py", "QRE_finder.py", "STAR", "bedtools", "bowtie", "bowtie-build", "bowtie-inspect", "bowtie2", "bowtie2-build", "bowtie2-inspect", "bwa", "ccp_circrna_expression.R", "cfinder_compare.R", "chimoutjunc_to_bed.py", "ciri_compare.R", "collect_read_stats.R", "convert_circrna_collect_tables.py", "cuffcompare", "cuffdiff", "cufflinks", "cuffmerge", "cuffnorm", "cuffquant", "dcc_compare.R", "dcc_fix_strand.R", "fasta_len.py", "fastq_rev_comp.py", "fastqc", "filterCirc.awk", "filterSpliceSiteCircles.pl", "filter_and_cast_circexp.R", "filter_fastq_reads.py", "filter_findcirc_res.R", "filter_segemehl.R", "find_circ.py", "findcirc_compare.R", "gene_annotation.R", "get_ce2_bwa_bks_reads.R", "get_ce2_bwa_circ_reads.py", "get_ce2_segemehl_bks_reads.R", "get_ce2_star_bks_reads.R", "get_ce2_th_bks_reads.R", "get_circompara_counts.R", "get_circrnaFinder_bks_reads.R", "get_ciri_bks_reads.R", "get_dcc_bks_reads.R", "get_findcirc_bks_reads.R", "get_gene_expression_files.R", "get_stringtie_rawcounts.R", "gffread", "gtfToGenePred", "gtf_collapse_features.py", "gtf_to_sam", "haarz.x", "hisat2", "hisat2-build", "htseq-count", "install_R_libs.R", "nrForwardSplicedReads.pl", "parallel", "pip", "postProcessStarAlignment.pl", "samtools", "samtools_v0", "scons", "segemehl.x", "split_start_end_gtf.py", "starCirclesToBed.pl", "stringtie", "testrealign_compare.R", "tophat2", "trim_read_header.py", "trimmomatic-0.39.jar", "unmapped2anchors.py","cf_filterChimout.awk", "circompara", "get_unmapped_reads_from_bam.sh", "install_circompara", "make_circrna_html", "make_indexes"}
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
