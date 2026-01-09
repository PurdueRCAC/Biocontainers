.. _backbone-label:

Manta
==============================

Introduction
~~~~~~~~
Manta calls structural variants (SVs) and indels from mapped paired-end sequencing reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/manta 
| Home page: https://github.com/Illumina/manta

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.6.0
  * - BELL
    - 1.6.0
  * - GAUTSCHI
    - 1.6.0
  * - NEGISHI
    - 1.6.0
  * - SCHOLAR
    - 1.6.0

Commands
~~~~~~~
- configManta.py
- python

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load manta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run manta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=manta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers manta

    configManta.py --normalBam=HCC1954.NORMAL.30x.compare.COST16011_region.bam \
        --tumorBam=G15512.HCC1954.1.COST16011_region.bam \
        --referenceFasta=Homo_sapiens_assembly19.COST16011_region.fa \
        --region=8:107652000-107655000 \
        --region=11:94974000-94989000 \
        --exome --runDir="MantaDemoAnalysis"

     python MantaDemoAnalysis/runWorkflow.py
