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
PASA, acronym for Program to Assemble Spliced Alignments (and pronounced 'pass-uh'), is a eukaryotic genome annotation tool that exploits spliced alignments of expressed transcript sequences to automatically model gene structures, and to maintain gene structure annotation consistent with the most recently available experimental sequence data. PASA also identifies and classifies all splicing variations supported by the transcript alignments.

More information
================
 - Docker hub:	https://hub.docker.com/r/pasapipeline/pasapipeline
 - Home page:   https://github.com/PASApipeline/PASApipeline
]==])

whatis("Name: Pasapipeline")
whatis("Version: 2.5.2-devb")
whatis("Description: PASA, acronym for Program to Assemble Spliced Alignments (and pronounced 'pass-uh'), is a eukaryotic genome annotation tool that exploits spliced alignments of expressed transcript sequences to automatically model gene structures, and to maintain gene structure annotation consistent with the most recently available experimental sequence data.")
whatis("Docker hub:  https://hub.docker.com/r/pasapipeline/pasapipeline")
whatis("Home page:   https://github.com/PASApipeline/PASApipeline")

if not (os.getenv("BIOC_SINGULARITY_MODULE") == "none") then
   local singularity_module = os.getenv("BIOC_SINGULARITY_MODULE") or "Singularity"
   if not (isloaded(singularity_module)) then
      load(singularity_module)
   end
end

conflict(myModuleName())

--       Think executables, mpirun, possibly Perl or Python, etc.
local image = "pasapipeline_pasapipeline:2.5.2-devb.sif"
local uri = "docker://pasapipeline/pasapipeline:2.5.2-devb"
local programs = {"pasa", "Launch_PASA_pipeline.pl","GMAP_multifasta_processor.pl", "blat_to_btab.pl", "blat_to_cdna_clusters.pl", "blat_top_hit_extractor.pl", "ensure_single_valid_alignment_per_cdna_per_cluster.pl", "errors_to_newalign_btabs.pl", "extract_FL_transdecoder_entries.pl", "get_failed_transcripts.pl", "gmap_to_btab.pl", "import_GMAP_gff3.pl", "pasa_alignment_assembler_textprocessor.pl", "pasa_asmbls_to_training_set.extract_reference_orfs.pl", "polyCistronAnalyzer.pl", "process_BLAT_alignments.pl", "process_GMAP_alignments_gff3_chimeras_ok.pl", "process_PBLAT_alignments.pl", "process_minimap2_alignments.pl", "pslx_to_gff3.pl", "run_spliced_aligners.pl", "sim4_to_btab.pl","Annotation_store_preloader.dbi", "Load_Current_Gene_Annotations.dbi", "PASA_transcripts_and_assemblies_to_GFF3.dbi", "UTR_category_analysis.dbi", "__drop_many_mysql_dbs.dbi", "alignment_assembly_to_gene_models.dbi", "alt_splice_AAT_alignment_generator.dbi", "assemble_clusters.dbi", "assembly_db_loader.dbi", "assign_clusters_by_gene_intergene_overlap.dbi", "assign_clusters_by_stringent_alignment_overlap.dbi", "build_comprehensive_transcriptome.dbi", "build_comprehensive_transcriptome.tabix.dbi", "cDNA_annotation_comparer.dbi", "cDNA_annotation_updater.dbi", "classify_alt_splice_as_UTR_or_protein.dbi", "classify_alt_splice_isoforms.dbi", "classify_alt_splice_isoforms_per_subcluster.dbi", "comprehensive_alt_splice_report.dbi", "compute_gene_coverage_by_incorporated_PASA_assemblies.dbi", "create_mysql_cdnaassembly_db.dbi", "create_sqlite_cdnaassembly_db.dbi", "describe_alignment_assemblies.dbi", "describe_alignment_assemblies_cgi_convert.dbi", "drop_mysql_db_if_exists.dbi", "dump_annot_store.dbi", "dump_valid_annot_updates.dbi", "extract_regions_for_probe_design.dbi", "extract_skipped_exons.dbi", "extract_transcript_alignment_clusters.dbi", "find_FL_equivalent_support.dbi", "find_alternate_internal_exons.dbi", "get_antisense_transcripts.dbi", "import_custom_alignments.dbi", "import_spliced_alignments.dbi", "invalidate_RNA-Seq_assembly_artifacts.dbi", "invalidate_single_exon_ESTs.dbi", "mapPolyAsites_to_genes.dbi", "pasa_asmbl_genes_to_GFF3.dbi", "pasa_asmbls_to_training_set.dbi", "polyA_site_summarizer.dbi", "polyA_site_transcript_mapper.dbi", "populate_alignments_via_btab.dbi", "populate_ath1_cdnas.dbi", "populate_cdna_clusters.dbi", "populate_mysql_assembly_alignment_field.dbi", "populate_mysql_assembly_sequence_field.dbi", "purge_PASA_database.dbi", "purge_annot_comparisons.dbi", "reassign_clusters_via_valid_align_coords.dbi", "reconstruct_FL_isoforms_from_parts.dbi", "report_alt_splicing_findings.dbi", "reset_to_prior_to_assembly_build.dbi", "retrieve_assembly_sequences.dbi", "set_spliced_orient_transcribed_orient.dbi", "splicing_events_in_subcluster_context.dbi", "splicing_variation_to_splicing_event.dbi", "subcluster_builder.dbi", "subcluster_loader.dbi", "test_assemble_clusters.dbi", "test_mysql_connection.dbi", "update_alignment_status.dbi", "update_clusters_coordinates.dbi", "update_fli_status.dbi", "update_spliced_orient.dbi", "upload_cdna_headers.dbi", "upload_transcript_data.dbi", "validate_alignments_in_db.dbi"}
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
prepend_path("SINGULARITYENV_PREPEND_PATH", "/usr/local/src/PASApipeline")
prepend_path("APPTAINERENV_PREPEND_PATH", "/usr/local/src/PASApipeline")
prepend_path("SINGULARITYENV_PREPEND_PATH", "/usr/local/src/PASApipeline/scripts")
prepend_path("APPTAINERENV_PREPEND_PATH", "/usr/local/src/PASApipeline/scripts")
