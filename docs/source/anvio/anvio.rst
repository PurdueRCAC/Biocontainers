.. _backbone-label:

Anvio
==============================

Introduction
~~~~~~~~
Anvio is an analysis and visualization platform for 'omics data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/anvio 
| Home page: https://github.com/merenlab/anvio

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 7.0
- 7.1_main
- 7.1_structure

Commands
~~~~~~~
- anvi-analyze-synteny
- anvi-cluster-contigs
- anvi-compute-ani
- anvi-compute-completeness
- anvi-compute-functional-enrichment
- anvi-compute-gene-cluster-homogeneity
- anvi-compute-genome-similarity
- anvi-convert-trnaseq-database
- anvi-db-info
- anvi-delete-collection
- anvi-delete-hmms
- anvi-delete-misc-data
- anvi-delete-state
- anvi-dereplicate-genomes
- anvi-display-contigs-stats
- anvi-display-metabolism
- anvi-display-pan
- anvi-display-structure
- anvi-estimate-genome-completeness
- anvi-estimate-genome-taxonomy
- anvi-estimate-metabolism
- anvi-estimate-scg-taxonomy
- anvi-estimate-trna-taxonomy
- anvi-experimental-organization
- anvi-export-collection
- anvi-export-contigs
- anvi-export-functions
- anvi-export-gene-calls
- anvi-export-gene-coverage-and-detection
- anvi-export-items-order
- anvi-export-locus
- anvi-export-misc-data
- anvi-export-splits-and-coverages
- anvi-export-splits-taxonomy
- anvi-export-state
- anvi-export-structures
- anvi-export-table
- anvi-gen-contigs-database
- anvi-gen-fixation-index-matrix
- anvi-gen-gene-consensus-sequences
- anvi-gen-gene-level-stats-databases
- anvi-gen-genomes-storage
- anvi-gen-network
- anvi-gen-phylogenomic-tree
- anvi-gen-structure-database
- anvi-gen-variability-matrix
- anvi-gen-variability-network
- anvi-gen-variability-profile
- anvi-get-aa-counts
- anvi-get-codon-frequencies
- anvi-get-enriched-functions-per-pan-group
- anvi-get-sequences-for-gene-calls
- anvi-get-sequences-for-gene-clusters
- anvi-get-sequences-for-hmm-hits
- anvi-get-short-reads-from-bam
- anvi-get-short-reads-mapping-to-a-gene
- anvi-get-split-coverages
- anvi-help
- anvi-import-collection
- anvi-import-functions
- anvi-import-items-order
- anvi-import-misc-data
- anvi-import-state
- anvi-import-taxonomy-for-genes
- anvi-import-taxonomy-for-layers
- anvi-init-bam
- anvi-inspect
- anvi-interactive
- anvi-matrix-to-newick
- anvi-mcg-classifier
- anvi-merge
- anvi-merge-bins
- anvi-meta-pan-genome
- anvi-migrate
- anvi-oligotype-linkmers
- anvi-pan-genome
- anvi-profile
- anvi-push
- anvi-refine
- anvi-rename-bins
- anvi-report-linkmers
- anvi-run-hmms
- anvi-run-interacdome
- anvi-run-kegg-kofams
- anvi-run-ncbi-cogs
- anvi-run-pfams
- anvi-run-scg-taxonomy
- anvi-run-trna-taxonomy
- anvi-run-workflow
- anvi-scan-trnas
- anvi-script-add-default-collection
- anvi-script-augustus-output-to-external-gene-calls
- anvi-script-calculate-pn-ps-ratio
- anvi-script-checkm-tree-to-interactive
- anvi-script-compute-ani-for-fasta
- anvi-script-enrichment-stats
- anvi-script-estimate-genome-size
- anvi-script-filter-fasta-by-blast
- anvi-script-fix-homopolymer-indels
- anvi-script-gen-CPR-classifier
- anvi-script-gen-distribution-of-genes-in-a-bin
- anvi-script-gen-help-pages
- anvi-script-gen-hmm-hits-matrix-across-genomes
- anvi-script-gen-programs-network
- anvi-script-gen-programs-vignette
- anvi-script-gen-pseudo-paired-reads-from-fastq
- anvi-script-gen-scg-domain-classifier
- anvi-script-gen-short-reads
- anvi-script-gen_stats_for_single_copy_genes.R
- anvi-script-gen_stats_for_single_copy_genes.py
- anvi-script-gen_stats_for_single_copy_genes.sh
- anvi-script-get-collection-info
- anvi-script-get-coverage-from-bam
- anvi-script-get-hmm-hits-per-gene-call
- anvi-script-get-primer-matches
- anvi-script-merge-collections
- anvi-script-pfam-accessions-to-hmms-directory
- anvi-script-predict-CPR-genomes
- anvi-script-process-genbank
- anvi-script-process-genbank-metadata
- anvi-script-reformat-fasta
- anvi-script-run-eggnog-mapper
- anvi-script-snvs-to-interactive
- anvi-script-tabulate
- anvi-script-transpose-matrix
- anvi-script-variability-to-vcf
- anvi-script-visualize-split-coverages
- anvi-search-functions
- anvi-self-test
- anvi-setup-interacdome
- anvi-setup-kegg-kofams
- anvi-setup-ncbi-cogs
- anvi-setup-pdb-database
- anvi-setup-pfams
- anvi-setup-scg-taxonomy
- anvi-setup-trna-taxonomy
- anvi-show-collections-and-bins
- anvi-show-misc-data
- anvi-split
- anvi-summarize
- anvi-trnaseq
- anvi-update-db-description
- anvi-update-structure-database
- anvi-upgrade

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load anvio

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run anvio on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=anvio
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers anvio

