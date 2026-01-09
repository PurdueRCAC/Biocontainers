.. _backbone-label:

ProtHint
==============================

Introduction
~~~~~~~
``ProtHint`` is a pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.6.0
  * - BELL
    - 2.6.0
  * - GAUTSCHI
    - 2.6.0
  * - NEGISHI
    - 2.6.0
  * - SCHOLAR
    - 2.6.0

Commands
~~~~~~  
- cds_with_upstream_support.py
- combine_gff_records.pl
- count_cds_overlaps.py
- flag_top_proteins.py
- gff_from_region_to_contig.pl
- make_chains.py
- nucseq_for_selected_genes.pl
- print_high_confidence.py
- print_longest_isoform.py
- proteins_from_gtf.pl
- prothint.py
- prothint2augustus.py
- run_spliced_alignment.pl
- run_spliced_alignment_pbs.pl
- select_best_proteins.py
- select_for_next_iteration.py
- spalnBatch.sh
- spaln_to_gff.py

Academic license
~~~~~  
.. note::
ProtHint depends on GenMark. To use GeneMark, users need to download license files by yourself.   

Go to the GeneMark web site: http://exon.gatech.edu/GeneMark/license_download.cgi. Check the boxes for ``GeneMark-ES/ET/EP ver 4.69_lic`` and ``LINUX 64`` next to it, fill out the form, then click "I agree". In the next page, right click and copy the link addresses for ``64 bit`` licenss. Paste the link addresses in the commands below::

    cd $HOME
    wget "replace with license URL"
    zcat gm_key_64.gz > .gm_key

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load prothint 

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ProtHint on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=prothint
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers prothint  
     
    prothint.py --threads 4 input/genome.fasta input/proteins.fasta --geneSeeds input/genemark.gtf --workdir test
