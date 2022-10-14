.. _backbone-label:

Merqury
==============================

Introduction
~~~~~~~~
Merqury is a tool to evaluate genome assemblies with k-mers and more.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/dovetailg/merqury 
| Home page: https://github.com/marbl/merqury

Versions
~~~~~~~~
- 1.3

Commands
~~~~~~~
- merqury.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load merqury

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run merqury on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=merqury
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers merqury

    merqury.sh F1.k18.meryl col0.hapmer.meryl cvi0.hapmer.meryl \
        athal_COL.fasta athal_CVI.fasta test
