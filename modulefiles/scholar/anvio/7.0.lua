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
Anvio is an analysis and visualization platform for 'omics data.

More information
================
 - BioContainers: https://biocontainers.pro/tools/anvio
 - Home page:    https://github.com/merenlab/anvio
]==])

whatis("Name: Anvio")
whatis("Version: 7")
whatis("Description: Anvio is an analysis and visualization platform for 'omics data.")
whatis("BioContainers: https://biocontainers.pro/tools/anvio")
whatis("Home page:     https://github.com/merenlab/anvio")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "meren_anvio:7.sif"
local uri = "docker://meren/anvio:7"
local programs = {"anvi-analyze-synteny", "anvi-cluster-contigs", "anvi-compute-ani", "anvi-compute-completeness", "anvi-compute-functional-enrichment", "anvi-compute-gene-cluster-homogeneity", "anvi-compute-genome-similarity", "anvi-convert-trnaseq-database", "anvi-db-info", "anvi-delete-collection", "anvi-delete-hmms", "anvi-delete-misc-data", "anvi-delete-state", "anvi-dereplicate-genomes", "anvi-display-contigs-stats", "anvi-display-metabolism", "anvi-display-pan", "anvi-display-structure", "anvi-estimate-genome-completeness", "anvi-estimate-genome-taxonomy", "anvi-estimate-metabolism", "anvi-estimate-scg-taxonomy", "anvi-estimate-trna-taxonomy", "anvi-experimental-organization", "anvi-export-collection", "anvi-export-contigs", "anvi-export-functions", "anvi-export-gene-calls", "anvi-export-gene-coverage-and-detection", "anvi-export-items-order", "anvi-export-locus", "anvi-export-misc-data", "anvi-export-splits-and-coverages", "anvi-export-splits-taxonomy", "anvi-export-state", "anvi-export-structures", "anvi-export-table", "anvi-gen-contigs-database", "anvi-gen-fixation-index-matrix", "anvi-gen-gene-consensus-sequences", "anvi-gen-gene-level-stats-databases", "anvi-gen-genomes-storage", "anvi-gen-network", "anvi-gen-phylogenomic-tree", "anvi-gen-structure-database", "anvi-gen-variability-matrix", "anvi-gen-variability-network", "anvi-gen-variability-profile", "anvi-get-aa-counts", "anvi-get-codon-frequencies", "anvi-get-enriched-functions-per-pan-group", "anvi-get-sequences-for-gene-calls", "anvi-get-sequences-for-gene-clusters", "anvi-get-sequences-for-hmm-hits", "anvi-get-short-reads-from-bam", "anvi-get-short-reads-mapping-to-a-gene", "anvi-get-split-coverages", "anvi-help", "anvi-import-collection", "anvi-import-functions", "anvi-import-items-order", "anvi-import-misc-data", "anvi-import-state", "anvi-import-taxonomy-for-genes", "anvi-import-taxonomy-for-layers", "anvi-init-bam", "anvi-inspect", "anvi-interactive", "anvi-matrix-to-newick", "anvi-mcg-classifier", "anvi-merge", "anvi-merge-bins", "anvi-meta-pan-genome", "anvi-migrate", "anvi-oligotype-linkmers", "anvi-pan-genome", "anvi-profile", "anvi-push", "anvi-refine", "anvi-rename-bins", "anvi-report-linkmers", "anvi-run-hmms", "anvi-run-interacdome", "anvi-run-kegg-kofams", "anvi-run-ncbi-cogs", "anvi-run-pfams", "anvi-run-scg-taxonomy", "anvi-run-trna-taxonomy", "anvi-run-workflow", "anvi-scan-trnas", "anvi-script-add-default-collection", "anvi-script-augustus-output-to-external-gene-calls", "anvi-script-calculate-pn-ps-ratio", "anvi-script-checkm-tree-to-interactive", "anvi-script-compute-ani-for-fasta", "anvi-script-enrichment-stats", "anvi-script-estimate-genome-size", "anvi-script-filter-fasta-by-blast", "anvi-script-fix-homopolymer-indels", "anvi-script-gen-CPR-classifier", "anvi-script-gen-distribution-of-genes-in-a-bin", "anvi-script-gen-help-pages", "anvi-script-gen-hmm-hits-matrix-across-genomes", "anvi-script-gen-programs-network", "anvi-script-gen-programs-vignette", "anvi-script-gen-pseudo-paired-reads-from-fastq", "anvi-script-gen-scg-domain-classifier", "anvi-script-gen-short-reads", "anvi-script-gen_stats_for_single_copy_genes.R", "anvi-script-gen_stats_for_single_copy_genes.py", "anvi-script-gen_stats_for_single_copy_genes.sh", "anvi-script-get-collection-info", "anvi-script-get-coverage-from-bam", "anvi-script-get-hmm-hits-per-gene-call", "anvi-script-get-primer-matches", "anvi-script-merge-collections", "anvi-script-pfam-accessions-to-hmms-directory", "anvi-script-predict-CPR-genomes", "anvi-script-process-genbank", "anvi-script-process-genbank-metadata", "anvi-script-reformat-fasta", "anvi-script-run-eggnog-mapper", "anvi-script-snvs-to-interactive", "anvi-script-tabulate", "anvi-script-transpose-matrix", "anvi-script-variability-to-vcf", "anvi-script-visualize-split-coverages", "anvi-search-functions", "anvi-self-test", "anvi-setup-interacdome", "anvi-setup-kegg-kofams", "anvi-setup-ncbi-cogs", "anvi-setup-pdb-database", "anvi-setup-pfams", "anvi-setup-scg-taxonomy", "anvi-setup-trna-taxonomy", "anvi-show-collections-and-bins", "anvi-show-misc-data", "anvi-split", "anvi-summarize", "anvi-trnaseq", "anvi-update-db-description", "anvi-update-structure-database", "anvi-upgrade"}
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
