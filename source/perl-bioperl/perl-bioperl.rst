.. _backbone-label:

BioPerl
==============================

Introduction
~~~~~~~~
``BioPerl`` is a collection of Perl modules that facilitate the development of Perl scripts for bioinformatics applications. It provides software modules for many of the typical tasks of bioinformatics programming. | For more information, please check its website: https://biocontainers.pro/tools/perl-bioperl.

Versions
~~~~~~~~
- 1.7.2-pl526

Commands
~~~~~~~
- SOAPsh.pl
- ace.pl
- bam2bedgraph
- bamToGBrowse.pl
- bdf2gdfont.pl
- bdftogd
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
- bp_pairwise_kaks
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
- ccconfig
- chartex
- chi2
- chrom_sizes.pl
- circo
- clustalw
- clustalw2
- corelist
- cpan
- cpanm
- dbilogstrip
- dbiprof
- dbiproxy
- debinhex.pl
- enc2xs
- encguess
- genomeCoverageBed.pl
- h2ph
- h2xs
- htmltree
- instmodsh
- json_pp
- json_xs
- lwp-download
- lwp-dump
- lwp-mirror
- lwp-request
- perl
- perl5.26.2
- perlbug
- perldoc
- perlivp
- perlthanks
- piconv
- pl2pm
- pod2html
- pod2man
- pod2text
- pod2usage
- podchecker
- podselect
- prove
- ptar
- ptardiff
- ptargrep
- shasum
- splain
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
- t_coffee
- tpage
- ttree
- unflatten
- webtidy
- xml_grep
- xml_merge
- xml_pp
- xml_spellcheck
- xml_split
- xpath
- xsubpp
- zipdetails

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load perl-bioperl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BioPerl on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=perl-bioperl
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers perl-bioperl
