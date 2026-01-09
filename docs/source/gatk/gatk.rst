.. _backbone-label:

GATK
==============================

Introduction
~~~~~~~~
``GATK`` (Genome Analysis Toolkit) is a collection of command-line tools for analyzing high-throughput sequencing data with a primary focus on variant discovery. 

| For more information, please check its website: https://biocontainers.pro/tools/gatk and its home page: https://www.broadinstitute.org/gatk/.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.8
  * - BELL
    - 3.8
  * - GAUTSCHI
    - 3.8
  * - NEGISHI
    - 3.8
  * - SCHOLAR
    - 3.8

Commands
~~~~~~~
- gatk3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gatk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run GATK on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=gatk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gatk

    gatk3 -T HaplotypeCaller  \
        -nct 24  -R hg38.fa \
        -I 19P0126636WES.sorted.bam \
         -o 19P0126636WES.HC.vcf 
