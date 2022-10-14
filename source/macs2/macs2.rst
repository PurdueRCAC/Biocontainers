.. _backbone-label:

MACS2
==============================

Introduction
~~~~~~~~
``MACS2`` is Model-based Analysis of ChIP-Seq for identifying transcript factor binding sites. 

| For more information, please check its website: https://biocontainers.pro/tools/macs2 and its home page on `Github`_.

Versions
~~~~~~~~
- 2.2.7.1-py39

Commands
~~~~~~~
- macs2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load macs2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MACS2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=macs2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers macs2

    macs2 callpeak -t ChIP.bam -c Control.bam -f BAM -g hs -n test -B -q 0.01
.. _Github: https://github.com/macs3-project/MACS
