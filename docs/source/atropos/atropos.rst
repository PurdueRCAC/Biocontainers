.. _backbone-label:

Atropos
==============================

Introduction
~~~~~~~~
``Atropos`` is a tool for specific, sensitive, and speedy trimming of NGS reads. 

| For more information, please check its website: https://biocontainers.pro/tools/atropos and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.1.17, 1.1.31
  * - BELL
    - 1.1.17, 1.1.31
  * - GAUTSCHI
    - 1.1.17, 1.1.31
  * - NEGISHI
    - 1.1.17, 1.1.31
  * - SCHOLAR
    - 1.1.17, 1.1.31

Commands
~~~~~~~
- atropos

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load atropos

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Atropos on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=atropos
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers atropos

    atropos --threads 4  \
        -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACGAGTTA \
        -o trimmed1.fq.gz -p trimmed2.fq.gz \
        -pe1 SRR13176582_1.fastq -pe2 SRR13176582_2.fastq

.. _Github: https://github.com/jdidion/atropos
