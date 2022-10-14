.. _backbone-label:

Macs3
==============================

Introduction
~~~~~~~~
``MACS3`` is Model-based Analysis of ChIP-Seq for identifying transcript factor. |For more information, please check its |Docker hub: https://hub.docker.com/r/lbmc/macs3/3.0.0a6 and its home page on `Github`_.

Versions
~~~~~~~~
- 3.0.0a6

Commands
~~~~~~~
- macs3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load macs3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Macs3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=macs3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers macs3

    macs3 callpeak -t ChIP.bam -c Control.bam -f BAM -g hs -n test -B -q 0.01
.. _Github: https://github.com/macs3-project/MACS
