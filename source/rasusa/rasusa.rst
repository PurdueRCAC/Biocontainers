.. _backbone-label:

Rasusa
==============================

Introduction
~~~~~~~~
Rasusa: Randomly subsample sequencing reads to a specified coverage.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/rasusa 
| Home page: https://github.com/mbhall88/rasusa

Versions
~~~~~~~~
- 0.6.0
- 0.7.0

Commands
~~~~~~~
- rasusa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rasusa

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rasusa on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rasusa
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rasusa

    rasusa -i seq_1.fq -i seq_2.fq  \
        --coverage 100 --genome-size 35mb  \
        -o out.r1.fq -o out.r2.fq
