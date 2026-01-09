.. _backbone-label:  

Picard Tools
============================== 

Introduction
~~~~~~~
``Picard`` is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF. 
Detailed usage can be found here: https://broadinstitute.github.io/picard/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.25.1, 2.26.10, 3.1.1
  * - BELL
    - 2.25.1, 2.26.10, 3.1.1, 3.3.0
  * - GAUTSCHI
    - 2.25.1, 2.26.10, 3.1.1
  * - NEGISHI
    - 2.25.1, 2.26.10, 3.1.1, 3.3.0
  * - SCHOLAR
    - 2.25.1, 2.26.10

Commands
~~~~~~
picard

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load picard/2.26.10 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run picard our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=picard
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers picard/2.26.10 
    
    picard MarkDuplicates -Xmx64g I=19P0126636WES_sorted.bam O=19P0126636WES_sorted_md.bam M=19P0126636WES.sorted.markdup.txt REMOVE_DUPLICATES=true
    picard BuildBamIndex -Xmx64g I=19P0126636WES_sorted_md.bam
    picard CreateSequenceDictionary -R hg38.fa -O hg38.dict
