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
Trinotate is a comprehensive annotation suite designed for automatic functional annotation of transcriptomes, particularly de novo assembled transcriptomes, from model or non-model organisms. 

More information
================
 - Home page:     https://github.com/Trinotate/Trinotate.github.io/blob/master/index.asciidoc
]==])

whatis("Name: Trinotate")
whatis("Version: 3.2.2")
whatis("Description: Trinotate is a comprehensive annotation suite designed for automatic functional annotation of transcriptomes, particularly de novo assembled transcriptomes, from model or non-model organisms.")
whatis("Home page:     https://github.com/Trinotate/Trinotate.github.io/blob/master/index.asciidoc")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
--local image = "quay.io_biocontainers_trinotate:3.2.2--pl5321hdfd78af_1.sif"
local image = "trinotate_3.2.2.sif"
local uri = ""
local programs = {"Trinotate", "Build_Trinotate_Boilerplate_SQLite_db.pl", "EMBL_dat_to_Trinotate_sqlite_resourceDB.pl", "EMBL_swissprot_parser.pl", "PFAM_dat_parser.pl", "PFAMtoGoParser.pl", "RnammerTranscriptome.pl", "TrinotateSeqLoader.pl", "Trinotate_BLAST_loader.pl", "Trinotate_GO_to_SLIM.pl", "Trinotate_GTF_loader.pl", "Trinotate_GTF_or_GFF3_annot_prep.pl", "Trinotate_PFAM_loader.pl", "Trinotate_RNAMMER_loader.pl", "Trinotate_SIGNALP_loader.pl", "Trinotate_TMHMM_loader.pl", "Trinotate_get_feature_name_encoding_attributes.pl", "Trinotate_report_writer.pl", "assign_eggnog_funccats.pl", "autoTrinotate.pl", "build_DE_cache_tables.pl", "cleanMe.pl", "cleanme.pl", "count_table_fields.pl", "create_clusters_tables.pl", "extract_GO_assignments_from_Trinotate_xls.pl", "extract_GO_for_BiNGO.pl", "extract_specific_genes_from_all_matrices.pl", "import_DE_results.pl", "import_Trinotate_xls_as_annot.pl", "import_expression_and_DE_results.pl", "import_expression_matrix.pl", "import_samples_n_expression_matrix.pl", "import_samples_only.pl", "import_transcript_annotations.pl", "import_transcript_clusters.pl", "import_transcript_names.pl", "init_Trinotate_sqlite_db.pl", "legacy_blast.pl", "make_cXp_html.pl", "obo_tab_to_sqlite_db.pl", "obo_to_tab.pl", "prep_nuc_prot_set_for_trinotate_loading.pl", "print.pl", "rnammer_supperscaffold_gff_to_indiv_transcripts.pl", "runMe.pl", "run_TrinotateWebserver.pl", "run_cluster_functional_enrichment_analysis.pl", "shrink_db.pl", "sqlite.pl", "superScaffoldGenerator.pl", "test_Barplot.pl", "test_GO_DAG.pl", "test_GenomeBrowser.pl", "test_Heatmap.pl", "test_Lineplot.pl", "test_Piechart.pl", "test_Scatter2D.pl", "test_Sunburst.pl", "trinotate_report_summary.pl", "update_blastdb.pl", "update_seq_n_annotation_fields.pl"}
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
