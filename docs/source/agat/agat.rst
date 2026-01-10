.. _backbone-label:

Agat
==============================

Introduction
~~~~~~~~
Agat is a suite of tools to handle gene annotations in any GTF/GFF format.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/agat 
| Home page: https://github.com/NBISweden/AGAT

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.8.1
  * - BELL
    - 0.8.1
  * - GAUTSCHI
    - 0.8.1
  * - NEGISHI
    - 0.8.1
  * - SCHOLAR
    - 0.8.1

Commands
~~~~~~~
- agat_convert_bed2gff.pl
- agat_convert_embl2gff.pl
- agat_convert_genscan2gff.pl
- agat_convert_mfannot2gff.pl
- agat_convert_minimap2_bam2gff.pl
- agat_convert_sp_gff2bed.pl
- agat_convert_sp_gff2gtf.pl
- agat_convert_sp_gff2tsv.pl
- agat_convert_sp_gff2zff.pl
- agat_convert_sp_gxf2gxf.pl
- agat_sp_Prokka_inferNameFromAttributes.pl
- agat_sp_add_introns.pl
- agat_sp_add_start_and_stop.pl
- agat_sp_alignment_output_style.pl
- agat_sp_clipN_seqExtremities_and_fixCoordinates.pl
- agat_sp_compare_two_BUSCOs.pl
- agat_sp_compare_two_annotations.pl
- agat_sp_complement_annotations.pl
- agat_sp_ensembl_output_style.pl
- agat_sp_extract_attributes.pl
- agat_sp_extract_sequences.pl
- agat_sp_filter_by_ORF_size.pl
- agat_sp_filter_by_locus_distance.pl
- agat_sp_filter_by_mrnaBlastValue.pl
- agat_sp_filter_feature_by_attribute_presence.pl
- agat_sp_filter_feature_by_attribute_value.pl
- agat_sp_filter_feature_from_keep_list.pl
- agat_sp_filter_feature_from_kill_list.pl
- agat_sp_filter_gene_by_intron_numbers.pl
- agat_sp_filter_gene_by_length.pl
- agat_sp_filter_incomplete_gene_coding_models.pl
- agat_sp_filter_record_by_coordinates.pl
- agat_sp_fix_cds_phases.pl
- agat_sp_fix_features_locations_duplicated.pl
- agat_sp_fix_fusion.pl
- agat_sp_fix_longest_ORF.pl
- agat_sp_fix_overlaping_genes.pl
- agat_sp_fix_small_exon_from_extremities.pl
- agat_sp_flag_premature_stop_codons.pl
- agat_sp_flag_short_introns.pl
- agat_sp_functional_statistics.pl
- agat_sp_keep_longest_isoform.pl
- agat_sp_kraken_assess_liftover.pl
- agat_sp_list_short_introns.pl
- agat_sp_load_function_from_protein_align.pl
- agat_sp_manage_IDs.pl
- agat_sp_manage_UTRs.pl
- agat_sp_manage_attributes.pl
- agat_sp_manage_functional_annotation.pl
- agat_sp_manage_introns.pl
- agat_sp_merge_annotations.pl
- agat_sp_prokka_fix_fragmented_gene_annotations.pl
- agat_sp_sensitivity_specificity.pl
- agat_sp_separate_by_record_type.pl
- agat_sp_statistics.pl
- agat_sp_webApollo_compliant.pl
- agat_sq_add_attributes_from_tsv.pl
- agat_sq_add_hash_tag.pl
- agat_sq_add_locus_tag.pl
- agat_sq_count_attributes.pl
- agat_sq_filter_feature_from_fasta.pl
- agat_sq_list_attributes.pl
- agat_sq_manage_IDs.pl
- agat_sq_manage_attributes.pl
- agat_sq_mask.pl
- agat_sq_remove_redundant_entries.pl
- agat_sq_repeats_analyzer.pl
- agat_sq_rfam_analyzer.pl
- agat_sq_split.pl
- agat_sq_stat_basic.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load agat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run agat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=agat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers agat
