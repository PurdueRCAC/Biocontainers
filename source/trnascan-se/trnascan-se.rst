.. _backbone-label:

Trnascan-se
==============================

Introduction
~~~~~~~~
``Trnascan-se`` is a convenient, ready-for-use means to identify tRNA genes in one or more query sequences. 
| For more information, please check its website: https://biocontainers.pro/tools/trnascan-se and its home page: http://lowelab.ucsc.edu/tRNAscan-SE/.

Versions
~~~~~~~~
- 2.0.9

Commands
~~~~~~~
- tRNAscan-SE

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trnascan-se

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Trnascan-se on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=trnascan-se
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trnascan-se

    tRNAscan-SE --thread 12 -o tRNA.out \
        -f rRNA.ss -m tRNA.stats genome.fasta
