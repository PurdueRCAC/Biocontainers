.. _backbone-label:

Transrate
==============================

Introduction
~~~~~~~~
Transrate is software for de-novo transcriptome assembly quality analysis.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/arnaudmeng/transrate 
| Home page: http://hibberdlab.com/transrate/

Versions
~~~~~~~~
- 1.0.3

Commands
~~~~~~~
- transrate

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load transrate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run transrate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=transrate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers transrate

    transrate --assembly mm10/Mus_musculus.GRCm38.cds.all.fa \
        --left seq_1.fq.gz \
        --right seq_2.fq.gz \
        --threads 12
