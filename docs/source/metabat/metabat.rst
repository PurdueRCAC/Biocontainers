.. _backbone-label:

Metabat
==============================

Introduction
~~~~~~~~
``Metabat`` is a robust statistical framework for reconstructing genomes from metagenomic data. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/metabat/metabat and its home page: https://bitbucket.org/berkeleylab/metabat/src/master/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.15-5
  * - BELL
    - 2.15-5
  * - GAUTSCHI
    - 2.15-5
  * - NEGISHI
    - 2.15-5
  * - SCHOLAR
    - 2.15-5

Commands
~~~~~~~
- aggregateBinDepths.pl
- aggregateContigOverlapsByBin.pl
- contigOverlaps
- jgi_summarize_bam_contig_depths
- merge_depths.pl
- metabat
- metabat1
- metabat2
- runMetaBat.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load metabat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Metabat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=metabat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers metabat

    metabat2 -m 10000 \
        -t 24 \
        -i contig.fasta \
        -o metabat2_output \
        -a depth.txt  
