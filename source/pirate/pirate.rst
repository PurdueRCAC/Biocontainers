.. _backbone-label:

Pirate
==============================

Introduction
~~~~~~~~
``Pirate`` is a pangenome analysis and threshold evaluation toolbox. | For more information, please check its website: https://biocontainers.pro/tools/pirate and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.4

Commands
~~~~~~~
- PIRATE
- FET.pl
- PIRATE_to_Rtab.pl
- PIRATE_to_roary.pl
- SOAPsh.pl
- ace.pl
- analyse_blast_outputs.pl
- analyse_loci_list.pl
- annotate_treeWAS_output.pl
- bamToGBrowse.pl
- bdf2gdfont.pl
- binhex.pl
- bp_aacomp.pl
- bp_biofetch_genbank_proxy.pl
- bp_bioflat_index.pl
- bp_biogetseq.pl
- bp_blast2tree.pl
- bp_bulk_load_gff.pl
- bp_chaos_plot.pl
- bp_classify_hits_kingdom.pl
- bp_composite_LD.pl
- bp_das_server.pl
- bp_dbsplit.pl
- bp_download_query_genbank.pl
- bp_extract_feature_seq.pl
- bp_fast_load_gff.pl
- bp_fastam9_to_table.pl
- bp_fetch.pl
- bp_filter_search.pl
- bp_find-blast-matches.pl
- bp_flanks.pl
- bp_gccalc.pl
- bp_genbank2gff.pl
- bp_genbank2gff3.pl
- bp_generate_histogram.pl
- bp_heterogeneity_test.pl
- bp_hivq.pl
- bp_hmmer_to_table.pl
- bp_index.pl
- bp_load_gff.pl
- bp_local_taxonomydb_query.pl
- bp_make_mrna_protein.pl
- bp_mask_by_search.pl
- bp_meta_gff.pl
- bp_mrtrans.pl
- bp_mutate.pl
- bp_netinstall.pl
- bp_nexus2nh.pl
- bp_nrdb.pl
- bp_oligo_count.pl
- bp_parse_hmmsearch.pl
- bp_process_gadfly.pl
- bp_process_sgd.pl
- bp_process_wormbase.pl
- bp_query_entrez_taxa.pl
- bp_remote_blast.pl
- bp_revtrans-motif.pl
- bp_search2alnblocks.pl
- bp_search2gff.pl
- bp_search2table.pl
- bp_search2tribe.pl
- bp_seq_length.pl
- bp_seqconvert.pl
- bp_seqcut.pl
- bp_seqfeature_delete.pl
- bp_seqfeature_gff3.pl
- bp_seqfeature_load.pl
- bp_seqpart.pl
- bp_seqret.pl
- bp_seqretsplit.pl
- bp_split_seq.pl
- bp_sreformat.pl
- bp_taxid4species.pl
- bp_taxonomy2tree.pl
- bp_translate_seq.pl
- bp_tree2pag.pl
- bp_unflatten_seq.pl
- cd-hit-2d-para.pl
- cd-hit-clstr_2_blm8.pl
- cd-hit-div.pl
- cd-hit-para.pl
- chrom_sizes.pl
- clstr2tree.pl
- clstr2txt.pl
- clstr2xml.pl
- clstr_cut.pl
- clstr_list.pl
- clstr_list_sort.pl
- clstr_merge.pl
- clstr_merge_noorder.pl
- clstr_quality_eval.pl
- clstr_quality_eval_by_link.pl
- clstr_reduce.pl
- clstr_renumber.pl
- clstr_rep.pl
- clstr_reps_faa_rev.pl
- clstr_rev.pl
- clstr_select.pl
- clstr_select_rep.pl
- clstr_size_histogram.pl
- clstr_size_stat.pl
- clstr_sort_by.pl
- clstr_sort_prot_by.pl
- clstr_sql_tbl.pl
- clstr_sql_tbl_sort.pl
- convert_to_distmat.pl
- convert_to_treeWAS.pl
- debinhex.pl
- genomeCoverageBed.pl
- legacy_blast.pl
- make_multi_seq.pl
- pangenome_variants_to_treeWAS.pl
- paralogs_to_Rtab.pl
- plot_2d.pl
- plot_len1.pl
- stag-autoschema.pl
- stag-db.pl
- stag-diff.pl
- stag-drawtree.pl
- stag-filter.pl
- stag-findsubtree.pl
- stag-flatten.pl
- stag-grep.pl
- stag-handle.pl
- stag-itext2simple.pl
- stag-itext2sxpr.pl
- stag-itext2xml.pl
- stag-join.pl
- stag-merge.pl
- stag-mogrify.pl
- stag-parse.pl
- stag-query.pl
- stag-splitter.pl
- stag-view.pl
- stag-xml2itext.pl
- stubmaker.pl
- subsample_outputs.pl
- subset_alignments.pl
- unique_sequences.pl
- update_blastdb.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pirate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pirate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pirate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pirate

.. _Github: https://github.com/SionBayliss/PIRATE
