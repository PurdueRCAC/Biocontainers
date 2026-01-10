.. _backbone-label:

Rseqc
==============================

Introduction
~~~~~~~~
Rseqc is a package provides a number of useful modules that can comprehensively evaluate high throughput sequence data especially RNA-seq data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rseqc 
| Home page: http://rseqc.sourceforge.net

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
    - 4.0.0
  * - BELL
    - 4.0.0
  * - GAUTSCHI
    - 4.0.0
  * - NEGISHI
    - 4.0.0
  * - SCHOLAR
    - 4.0.0

Commands
~~~~~~~
- FPKM-UQ.py
- FPKM_count.py
- RNA_fragment_size.py
- RPKM_saturation.py
- aggregate_scores_in_intervals.py
- align_print_template.py
- axt_extract_ranges.py
- axt_to_fasta.py
- axt_to_lav.py
- axt_to_maf.py
- bam2fq.py
- bam2wig.py
- bam_stat.py
- bed_bigwig_profile.py
- bed_build_windows.py
- bed_complement.py
- bed_count_by_interval.py
- bed_count_overlapping.py
- bed_coverage.py
- bed_coverage_by_interval.py
- bed_diff_basewise_summary.py
- bed_extend_to.py
- bed_intersect.py
- bed_intersect_basewise.py
- bed_merge_overlapping.py
- bed_rand_intersect.py
- bed_subtract_basewise.py
- bnMapper.py
- clipping_profile.py
- deletion_profile.py
- div_snp_table_chr.py
- divide_bam.py
- find_in_sorted_file.py
- geneBody_coverage.py
- geneBody_coverage2.py
- gene_fourfold_sites.py
- get_scores_in_intervals.py
- infer_experiment.py
- inner_distance.py
- insertion_profile.py
- int_seqs_to_char_strings.py
- interval_count_intersections.py
- interval_join.py
- junction_annotation.py
- junction_saturation.py
- lav_to_axt.py
- lav_to_maf.py
- line_select.py
- lzop_build_offset_table.py
- mMK_bitset.py
- maf_build_index.py
- maf_chop.py
- maf_chunk.py
- maf_col_counts.py
- maf_col_counts_all.py
- maf_count.py
- maf_covered_ranges.py
- maf_covered_regions.py
- maf_div_sites.py
- maf_drop_overlapping.py
- maf_extract_chrom_ranges.py
- maf_extract_ranges.py
- maf_extract_ranges_indexed.py
- maf_filter.py
- maf_filter_max_wc.py
- maf_gap_frequency.py
- maf_gc_content.py
- maf_interval_alignibility.py
- maf_limit_to_species.py
- maf_mapping_word_frequency.py
- maf_mask_cpg.py
- maf_mean_length_ungapped_piece.py
- maf_percent_columns_matching.py
- maf_percent_identity.py
- maf_print_chroms.py
- maf_print_scores.py
- maf_randomize.py
- maf_region_coverage_by_src.py
- maf_select.py
- maf_shuffle_columns.py
- maf_species_in_all_files.py
- maf_split_by_src.py
- maf_thread_for_species.py
- maf_tile.py
- maf_tile_2.py
- maf_tile_2bit.py
- maf_to_axt.py
- maf_to_concat_fasta.py
- maf_to_fasta.py
- maf_to_int_seqs.py
- maf_translate_chars.py
- maf_truncate.py
- maf_word_frequency.py
- mask_quality.py
- mismatch_profile.py
- nib_chrom_intervals_to_fasta.py
- nib_intervals_to_fasta.py
- nib_length.py
- normalize_bigwig.py
- one_field_per_line.py
- out_to_chain.py
- overlay_bigwig.py
- prefix_lines.py
- pretty_table.py
- qv_to_bqv.py
- random_lines.py
- read_GC.py
- read_NVC.py
- read_distribution.py
- read_duplication.py
- read_hexamer.py
- read_quality.py
- split_bam.py
- split_paired_bam.py
- table_add_column.py
- table_filter.py
- tfloc_summary.py
- tin.py
- ucsc_gene_table_to_intervals.py
- wiggle_to_array_tree.py
- wiggle_to_binned_array.py
- wiggle_to_chr_binned_array.py
- wiggle_to_simple.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rseqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rseqc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rseqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rseqc
