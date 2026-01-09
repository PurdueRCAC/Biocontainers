.. _backbone-label:

Mitofinder
==============================

Introduction
~~~~~~~~
``Mitofinder`` is a pipeline to assemble mitochondrial genomes and annotate mitochondrial genes from trimmed read sequencing data. 

| For more information, please check its website: https://cloud.sylabs.io/library/remiallio/default/mitofinder and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.4.1
  * - BELL
    - 1.4.1
  * - GAUTSCHI
    - 1.4.1
  * - NEGISHI
    - 1.4.1
  * - SCHOLAR
    - 1.4.1

Commands
~~~~~~~
- mitofinder

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mitofinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mitofinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mitofinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mitofinder

    mitofinder -j Aphaenogaster_megommata_SRR1303315 \
               -1 Aphaenogaster_megommata_SRR1303315_R1_cleaned.fastq.gz \
               -2 Aphaenogaster_megommata_SRR1303315_R2_cleaned.fastq.gz \
               -r reference.gb -o 5 -p 5 -m 10
.. _Github: https://github.com/RemiAllio/MitoFinder
