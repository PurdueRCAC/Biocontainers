.. _backbone-label:

Pasapipeline
==============================

Introduction
~~~~~~~~
PASA, acronym for Program to Assemble Spliced Alignments (and pronounced 'pass-uh'), is a eukaryotic genome annotation tool that exploits spliced alignments of expressed transcript sequences to automatically model gene structures, and to maintain gene structure annotation consistent with the most recently available experimental sequence data. PASA also identifies and classifies all splicing variations supported by the transcript alignments.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/pasapipeline/pasapipeline 
| Home page: https://github.com/PASApipeline/PASApipeline

Versions
~~~~~~~~
- 2.5.2-devb

Commands
~~~~~~~
- pasa
- Launch_PASA_pipeline.pl
- GMAP_multifasta_processor.pl
- blat_to_btab.pl
- blat_to_cdna_clusters.pl
- blat_top_hit_extractor.pl
- ensure_single_valid_alignment_per_cdna_per_cluster.pl
- errors_to_newalign_btabs.pl
- extract_FL_transdecoder_entries.pl
- get_failed_transcripts.pl
- gmap_to_btab.pl
- import_GMAP_gff3.pl
- pasa_alignment_assembler_textprocessor.pl
- pasa_asmbls_to_training_set.extract_reference_orfs.pl
- polyCistronAnalyzer.pl
- process_BLAT_alignments.pl
- process_GMAP_alignments_gff3_chimeras_ok.pl
- process_PBLAT_alignments.pl
- process_minimap2_alignments.pl
- pslx_to_gff3.pl
- run_spliced_aligners.pl
- sim4_to_btab.pl
- Annotation_store_preloader.dbi
- Load_Current_Gene_Annotations.dbi
- PASA_transcripts_and_assemblies_to_GFF3.dbi
- UTR_category_analysis.dbi
- __drop_many_mysql_dbs.dbi
- alignment_assembly_to_gene_models.dbi
- alt_splice_AAT_alignment_generator.dbi
- assemble_clusters.dbi
- assembly_db_loader.dbi
- assign_clusters_by_gene_intergene_overlap.dbi
- assign_clusters_by_stringent_alignment_overlap.dbi
- build_comprehensive_transcriptome.dbi
- build_comprehensive_transcriptome.tabix.dbi
- cDNA_annotation_comparer.dbi
- cDNA_annotation_updater.dbi
- classify_alt_splice_as_UTR_or_protein.dbi
- classify_alt_splice_isoforms.dbi
- classify_alt_splice_isoforms_per_subcluster.dbi
- comprehensive_alt_splice_report.dbi
- compute_gene_coverage_by_incorporated_PASA_assemblies.dbi
- create_mysql_cdnaassembly_db.dbi
- create_sqlite_cdnaassembly_db.dbi
- describe_alignment_assemblies.dbi
- describe_alignment_assemblies_cgi_convert.dbi
- drop_mysql_db_if_exists.dbi
- dump_annot_store.dbi
- dump_valid_annot_updates.dbi
- extract_regions_for_probe_design.dbi
- extract_skipped_exons.dbi
- extract_transcript_alignment_clusters.dbi
- find_FL_equivalent_support.dbi
- find_alternate_internal_exons.dbi
- get_antisense_transcripts.dbi
- import_custom_alignments.dbi
- import_spliced_alignments.dbi
- invalidate_RNA-Seq_assembly_artifacts.dbi
- invalidate_single_exon_ESTs.dbi
- mapPolyAsites_to_genes.dbi
- pasa_asmbl_genes_to_GFF3.dbi
- pasa_asmbls_to_training_set.dbi
- polyA_site_summarizer.dbi
- polyA_site_transcript_mapper.dbi
- populate_alignments_via_btab.dbi
- populate_ath1_cdnas.dbi
- populate_cdna_clusters.dbi
- populate_mysql_assembly_alignment_field.dbi
- populate_mysql_assembly_sequence_field.dbi
- purge_PASA_database.dbi
- purge_annot_comparisons.dbi
- reassign_clusters_via_valid_align_coords.dbi
- reconstruct_FL_isoforms_from_parts.dbi
- report_alt_splicing_findings.dbi
- reset_to_prior_to_assembly_build.dbi
- retrieve_assembly_sequences.dbi
- set_spliced_orient_transcribed_orient.dbi
- splicing_events_in_subcluster_context.dbi
- splicing_variation_to_splicing_event.dbi
- subcluster_builder.dbi
- subcluster_loader.dbi
- test_assemble_clusters.dbi
- test_mysql_connection.dbi
- update_alignment_status.dbi
- update_clusters_coordinates.dbi
- update_fli_status.dbi
- update_spliced_orient.dbi
- upload_cdna_headers.dbi
- upload_transcript_data.dbi
- validate_alignments_in_db.dbi

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pasapipeline

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pasapipeline on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pasapipeline
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pasapipeline
