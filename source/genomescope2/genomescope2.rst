.. _backbone-label:

Genomescope2
==============================

Introduction
~~~~~~~~
``Genomescope2``: Reference-free profiling of polyploid genomes. | For more information, please check its website: https://biocontainers.pro/tools/genomescope2 and its home page on `Github`_.

Versions
~~~~~~~~
- 2.0

Commands
~~~~~~~
- genomescope2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load genomescope2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Genomescope2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genomescope2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genomescope2

    wget https://raw.githubusercontent.com/schatzlab/genomescope/master/analysis/real_data/ara_F1_21.hist

    genomescope2 -i ara_F1_21.hist -o output -k 21
.. _Github: https://github.com/tbenavi1/genomescope2.0
