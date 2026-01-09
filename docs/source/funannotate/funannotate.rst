.. _backbone-label:

Funannotate
==============================

Introduction
~~~~~~~~
``Funannotate`` is a genome prediction, annotation, and comparison software package. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/nextgenusfs/funannotate and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - BELL
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - GAUTSCHI
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - NEGISHI
    - v1.8.17, 1.8.10, 1.8.13, 1.8.15
  * - SCHOLAR
    - 1.8.10, 1.8.13

Commands
~~~~~~~
- funannotate

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load funannotate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Funannotate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=funannotate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers funannotate

    funannotate clean -i genome.fa -o genome_cleaned.fa
    funannotate sort -i genome_cleaned.fa -o genome_cleaned_sorted.fa
    funannotate predict -i genome_cleaned_sorted.fa -o predict_out --species "arabidopsis" --rna_bam  RNAseq.bam --cpus 12
.. _Github: https://github.com/nextgenusfs/funannotate
