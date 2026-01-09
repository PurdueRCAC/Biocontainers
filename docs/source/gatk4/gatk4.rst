.. _backbone-label:  

GATK4
============================== 

Introduction
~~~~~~~
``GATK (Genome Analysis Toolkit)`` is a collection of command-line tools for analyzing high-throughput sequencing data with a primary focus on variant discovery. Detailed usage can be found here: https://www.broadinstitute.org/gatk/.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - BELL
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - GAUTSCHI
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - NEGISHI
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0, 4.6.0.0
  * - SCHOLAR
    - 4.2.0, 4.2.5.0, 4.2.6.1, 4.3.0.0

Commands
~~~~~~
gatk

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gatk4/4.2.5.0

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gatk4 our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=gatk4
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gatk4/4.2.5.0
    
    gatk  --java-options "-Xmx12G -XX:ParallelGCThreads=24" HaplotypeCaller -R hg38.fa -I 19P0126636WES.sorted.bam  -O 19P0126636WES.HC.vcf --sample-name 19P0126636
