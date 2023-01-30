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
Trinity assembles transcript sequences from Illumina RNA-Seq data.

More information
================
 - BioContainers: https://biocontainers.pro/tools/trinity
 - Home page:     https://github.com/trinityrnaseq/trinityrnaseq/
]==])

whatis("Name: Trinity")
whatis("Version: 2.15.0")
whatis("Description: Trinity assembles transcript sequences from Illumina RNA-Seq data.")
whatis("BioContainers: https://biocontainers.pro/tools/trinity")
whatis("Home page:     https://github.com/trinityrnaseq/trinityrnaseq/")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName(), "bowtie", "bowtie2", "jellyfish", "samtools", "trimmomatic", "R", "r")

local image = "trinityrnaseq_trinityrnaseq:2.15.0.sif"
local uri = "docker://trinityrnaseq/trinityrnaseq:2.15.0"
local programs = {"Trinity", "TrinityStats.pl", "Trinity_gene_splice_modeler.py",
                  "ace2sam", "align_and_estimate_abundance.pl",
		  "analyze_blastPlus_topHit_coverage.pl", "analyze_diff_expr.pl",
		  "blast2sam.pl", "bowtie", "bowtie2", "bowtie2-build",
                  "bowtie2-inspect", "bowtie2sam.pl",
		  "contig_ExN50_statistic.pl", "define_clusters_by_cutting_tree.pl",
		  "export2sam.pl", "extract_supertranscript_from_reference.py",
		  "filter_low_expr_transcripts.pl", "get_Trinity_gene_to_trans_map.pl",
		  "insilico_read_normalization.pl", "interpolate_sam.pl",
		  "jellyfish", "novo2sam.pl",
		  "retrieve_sequences_from_fasta.pl", "run_DE_analysis.pl",
		  "sam2vcf.pl", "samtools", "samtools.pl", "seq_cache_populate.pl",
		  "seqtk-trinity", "sift_bam_max_cov.pl", "soap2sam.pl",
		  "tabix", "trimmomatic", "wgsim", "wgsim_eval.pl", "zoom2sam.pl",
                 }
-- Container has C and POSIX locales - force to avoid Perl warnings.
local entrypoint_args = "env LANG=C"

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
prepend_path("SINGULARITYENV_PREPEND_PATH","/usr/local/bin/util")

